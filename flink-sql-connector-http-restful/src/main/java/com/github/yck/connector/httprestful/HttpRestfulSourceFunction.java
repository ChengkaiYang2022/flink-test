package com.github.yck.connector.httprestful;

import com.github.yck.connector.util.Result;
import com.github.yck.connector.util.ResultGenerator;
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
    private final DeserializationRestfulSchema deserializer;

    private volatile boolean isRunning = true;
    @Override
    public void open(Configuration parameters) throws Exception {
        deserializer.open(
                RuntimeContextInitializationContextAdapters.deserializationAdapter(
                        getRuntimeContext()));
    }
    public HttpRestfulSourceFunction(  String path, Integer port, byte byteDelimiter, DeserializationRestfulSchema deserializer) {
        this.path = path;
        this.port = port;
        this.byteDelimiter = byteDelimiter;
        this.deserializer = deserializer;
    }
    private static final String METHOD_POST = "POST";
    private static final String METHOD_DELETE = "DELETE";

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
                    RowData rowData = deserializer.deserializeSingleJsonStringWithRowKind(bytes, rowKind);
                    ctx.collect(rowData);
                    String responseBody = ResultGenerator.getCodeAndResult(HttpURLConnection.HTTP_OK,"success").toString();
                    he.sendResponseHeaders(HttpURLConnection.HTTP_OK, responseBody.length());
                    he.getResponseBody().write(IOUtils.toByteArray(new StringReader(responseBody), "UTF-8"));
                }
                private void responseToClientAndRejectData(HttpExchange he, String message) throws IOException {
                    String responseBody = ResultGenerator.getCodeAndResult(HttpURLConnection.HTTP_BAD_METHOD,message).toString();
                    he.sendResponseHeaders(HttpURLConnection.HTTP_BAD_METHOD, responseBody.length());
                    he.getResponseBody().write(IOUtils.toByteArray(new StringReader(responseBody), "UTF-8"));

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
                            responseToClientAndRejectData(he,e.getLocalizedMessage());
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
