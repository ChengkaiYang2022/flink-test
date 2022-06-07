package com.github.yck.connector.httprestful;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import jdk.internal.org.objectweb.asm.Handle;
import org.apache.commons.io.IOUtils;
import org.apache.flink.api.common.serialization.DeserializationSchema;
import org.apache.flink.api.common.serialization.RuntimeContextInitializationContextAdapters;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.api.java.typeutils.ResultTypeQueryable;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.connector.datagen.table.types.RowDataGenerator;
import org.apache.flink.streaming.api.functions.source.RichSourceFunction;
import org.apache.flink.table.data.GenericRowData;
import org.apache.flink.table.data.RowData;
import org.apache.flink.types.RowKind;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.util.HashSet;
import java.util.Set;

public class HttpRestfulSourceFunction extends RichSourceFunction<RowData>
        implements ResultTypeQueryable<RowData> {
    private HttpServer currentHttpServer;
    private String path;
    private Integer port;
    private final byte byteDelimiter;
    private final DeserializationSchema<RowData> deserializer;
    private static final String RESPONSE_STRING_200 = "{\"code\": 200,\"message\":\"success\"}";
    private static final String RESPONSE_STRING_405 = "{\"code\": 405,\"message\":\"Not support this method."+"\"}";

    private volatile boolean isRunning = true;
    @Override
    public void open(Configuration parameters) throws Exception {
        deserializer.open(
                RuntimeContextInitializationContextAdapters.deserializationAdapter(
                        getRuntimeContext()));
    }
    public HttpRestfulSourceFunction(  String path, Integer port, byte byteDelimiter, DeserializationSchema<RowData> deserializer) {
        this.path = path;
        this.port = port;
        this.byteDelimiter = byteDelimiter;
        this.deserializer = deserializer;
    }
    private static final String METHOD_POST = "POST";
    private static final String METHOD_DELETE = "DELETE";
    private static final Set<String> METHOD_SET = new HashSet<String>(){{
        add(METHOD_POST);add(METHOD_DELETE);
    }};
    @Override
    public TypeInformation<RowData> getProducedType() {
        return deserializer.getProducedType();
    }
    @Override
    public void run(SourceContext<RowData> ctx) throws Exception {
        while (isRunning){
            // open and consume from http
            if(currentHttpServer != null){
                Thread.sleep(1000);
                continue;
            }
            currentHttpServer = HttpServer.create(new InetSocketAddress(this.port), 0);

            currentHttpServer.createContext(this.path,new HttpHandler(){
                private void responseToClientAndAcceptData(HttpExchange he,RowKind rowKind) throws IOException {
                    byte[] bytes = IOUtils.toByteArray(he.getRequestBody());
                    // bytes -> json -> RowData cause json format is so much better than csv
                    RowData rowData = deserializer.deserialize(bytes);
                    rowData.setRowKind(rowKind);
                    ctx.collect(rowData);
                    he.sendResponseHeaders(HttpURLConnection.HTTP_OK, RESPONSE_STRING_200.length());
                    he.getResponseBody().write(IOUtils.toByteArray(new StringReader(RESPONSE_STRING_200), "UTF-8"));
                }
                private void responseToClientAndRejectData(HttpExchange he) throws IOException {
                    he.sendResponseHeaders(HttpURLConnection.HTTP_BAD_METHOD, RESPONSE_STRING_405.length());
                    OutputStream os = he.getResponseBody();
                    os.write(IOUtils.toByteArray(new StringReader(RESPONSE_STRING_405), "UTF-8"));

                }
                @Override
                public void handle(HttpExchange he) throws IOException {
                        try {
                            String method = he.getRequestMethod().toUpperCase().intern();

                            // set Row KIND accounting to the restful type.
                            switch (method){
                                case METHOD_POST:
                                    responseToClientAndAcceptData(he, RowKind.INSERT);
                                    break;
                                case METHOD_DELETE:
                                    responseToClientAndAcceptData(he, RowKind.DELETE);
                                    break;
                                default:
                                    throw new IllegalStateException("Unexpected value: " + method);
                            }

                        } catch (Exception e) {
                            responseToClientAndRejectData(he);
                            System.err.println(e);
                        }finally {
                            he.close();
                        }
                }
                });
            currentHttpServer.setExecutor(null);
            currentHttpServer.start();

        }
    }

    @Override
    public void cancel() {
        isRunning = false;
        try {
            currentHttpServer.stop(0);
        }catch (Exception e){
            System.err.println(e);
        }
    }
}
