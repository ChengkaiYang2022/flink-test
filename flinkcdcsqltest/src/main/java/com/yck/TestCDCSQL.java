package com.yck;

import org.apache.flink.calcite.shaded.com.google.common.io.Resources;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.TableEnvironment;

import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

public class TestCDCSQL {
    private static final String[] DDL_PATH = {"sql/table.sql",
            "sql/table_a_1.sql","sql/table_a_2.sql","sql/table_a_3.sql"
    };

    public static String getTableSql(String path){
        String strings = "";
        URL url = Resources.getResource(path);
        try {
            strings = Resources.toString(url, Charset.forName("UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return strings;
    }
    public static void main(String[] args) {

        EnvironmentSettings settings = EnvironmentSettings
                .newInstance()
                .useBlinkPlanner()
                .inStreamingMode()
                .build();

        TableEnvironment tEnv = TableEnvironment.create(settings);
        for (String path : DDL_PATH) {
            tEnv.executeSql(getTableSql(path));
        }
//        tEnv.executeSql("CREATE TABLE SourceTable (f0 String) with ('connector' = 'datagen','rows-per-second' = '1')");

        tEnv.executeSql("CREATE TABLE SinkTable " +
                "(id Int,f1 String, f2 String,PRIMARY KEY(id) NOT ENFORCED)" +
                "WITH ('connector' = 'print','sink.parallelism'='1','standard-error'='true')  ");

        tEnv.executeSql("INSERT INTO SinkTable SELECT * FROM table_a"
//                        + " UNION ALL SELECT * FROM table_a_1"
//                        + " UNION ALL SELECT * FROM table_a_2"
//                +" UNION ALL SELECT * FROM table_a_3"
                );
//        tEnv.sqlQuery("select * from SinkTable").printSchema();
//        env.execute();

    }
}
