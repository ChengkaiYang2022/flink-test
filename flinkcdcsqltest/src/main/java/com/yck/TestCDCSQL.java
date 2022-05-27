package com.yck;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.TableEnvironment;

public class TestCDCSQL {
    public static void main(String[] args) {

        EnvironmentSettings settings = EnvironmentSettings
                .newInstance()
                .useBlinkPlanner()
                .inStreamingMode()
                .build();

        TableEnvironment tEnv = TableEnvironment.create(settings);
        tEnv.executeSql("CREATE TABLE table_a (\n" +
                "               id INT NOT NULL,\n" +
                "                ztid STRING,\n" +
                "                ztmc STRING,\n" +
                "                 PRIMARY KEY(id) NOT ENFORCED\n" +
                ") WITH (\n" +
                " 'connector' = 'mysql-cdc',\n" +
                " 'hostname' = '192.168.56.101',\n" +
                " 'port' = '3306',\n" +
                " 'username' = 'root',\n" +
                " 'password' = '123456',\n" +
                " 'database-name' = 'test1',\n" +
                " 'table-name' = 'table_a'\n" +
                ")");
//        tEnv.executeSql("CREATE TABLE SourceTable (f0 String) with ('connector' = 'datagen','rows-per-second' = '1')");

        tEnv.executeSql("CREATE TEMPORARY TABLE SinkTable WITH ('connector' = 'print') LIKE table_a (EXCLUDING ALL) ");

        tEnv.executeSql("INSERT INTO SinkTable SELECT * FROM table_a");
//        tEnv.sqlQuery("select * from SinkTable").printSchema();
//        env.execute();

    }
}
