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
import org.apache.flink.streaming.api.functions.source.RichSourceFunction;
import org.apache.flink.table.data.RowData;
import org.apache.flink.types.RowKind;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;

public class HttpRestfulSourceFunction extends RichSourceFunction<RowData>
        implements ResultTypeQueryable<RowData> {
    private HttpServer currentHttpServer;
    private String path;
    private Integer port;
    private final byte byteDelimiter;
    private final DeserializationSchema<RowData> deserializer;
    private static final String RESPONSE_STRING = "{\"code\": 200,\"message\":\"success\"}";

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
                @Override
                public void handle(HttpExchange he) throws IOException {
                    if (he.getRequestMethod().equalsIgnoreCase("POST")) {
                        try {
                            InputStream is = he.getRequestBody();
//                            System.out.println(IOUtils.toString(is));
                            OutputStream os = he.getResponseBody();
                            he.sendResponseHeaders(HttpURLConnection.HTTP_OK, RESPONSE_STRING.length());
                            os.write(IOUtils.toByteArray(new StringReader(RESPONSE_STRING), "UTF-8"));
                            byte[] bytes = IOUtils.toByteArray(is);
                            // TODO bytes -> json -> RowData cause json format is so much better than csv
                            RowData rowData = deserializer.deserialize(bytes);
                            // TODO set Row KIND accounting to the restful type.
                            rowData.setRowKind(RowKind.INSERT);
                            // TODO should support collect a list of rowData here.
                            ctx.collect(rowData);
                        } catch (Exception e) {
                            System.err.println(e);
                        }finally {
                            he.close();
                        }
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
