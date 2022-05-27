package com.yck;
import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import com.ververica.cdc.debezium.JsonDebeziumDeserializationSchema;
import com.ververica.cdc.connectors.mysql.source.MySqlSource;

public class MySqlBinlogSourceExample {
    public static void main(String[] args) throws Exception {
        MySqlSource<String> mySqlSource = MySqlSource.<String>builder()
                .hostname("192.168.56.101")
                .port(3306)
                .databaseList("test1") // set captured database
                .tableList("test1.table_a") // set captured table
                .username("root")
                .password("123456")
                .deserializer(new JsonDebeziumDeserializationSchema()) // converts SourceRecord to JSON String
                .build();

        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // enable checkpoint
        env.enableCheckpointing(1000);

        env.fromSource(mySqlSource, WatermarkStrategy.noWatermarks(), "MySQL Source")
                // set 4 parallel source tasks
                .setParallelism(1)
                .map(new MapFunction<String, Object>() {
                    @Override
                    public Object map(String s) throws Exception {
                        System.out.println(s);
                        return s;
                    }
                }).
                setParallelism(1); // use parallelism 1 for sink to keep message ordering

        env.execute("Print MySQL Snapshot + Binlog");
    }
}
