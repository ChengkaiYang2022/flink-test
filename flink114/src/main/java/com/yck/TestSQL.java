package com.yck;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.TableEnvironment;

public class TestSQL {
    public static void main(String[] args) {

        EnvironmentSettings settings = EnvironmentSettings
                .newInstance()
                .inStreamingMode()
                //.inBatchMode()

                .build();

        TableEnvironment tableEnv = TableEnvironment.create(settings);
        Configuration configuration = tableEnv.getConfig().getConfiguration();
        configuration.setInteger("table.exec.resource.default-parallelism",1);

        tableEnv.executeSql("CREATE TABLE SourceTable (f0 String) with ('connector' = 'datagen','rows-per-second' = '1')");
        // WILL WORK WITH (EXCLUDING OPTIONS)
//        tableEnv.executeSql("CREATE TEMPORARY TABLE SinkTable WITH ('connector' = 'print') LIKE SourceTable (EXCLUDING OPTIONS) ");
        // WILL NOT WORK WITHOUT (EXCLUDING OPTIONS)!
        tableEnv.executeSql("CREATE TABLE SinkTable (product STRING) WITH ('connector' = 'blackhole') ");

        tableEnv.executeSql("INSERT INTO SinkTable SELECT f0 FROM SourceTable");
    }
}
