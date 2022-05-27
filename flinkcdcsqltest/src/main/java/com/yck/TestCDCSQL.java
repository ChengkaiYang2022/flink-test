package com.yck;

import org.apache.flink.calcite.shaded.com.google.common.io.Resources;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.TableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

public class TestCDCSQL {
    private static final Logger LOG = LoggerFactory.getLogger(TestCDCSQL.class);
    private static final String[] DDL_PATH = {"sql/table.sql",
            "sql/table_a_1.sql","sql/table_a_2.sql","sql/table_a_3.sql",
            "sql/table_a_sum.sql"
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
        LOG.debug("Start");
        EnvironmentSettings settings = EnvironmentSettings
                .newInstance()
                .useBlinkPlanner()
                .inStreamingMode()
                .build();

        TableEnvironment tEnv = TableEnvironment.create(settings);
        Configuration configuration = tEnv.getConfig().getConfiguration();
        // TODO 优化 https://nightlies.apache.org/flink/flink-docs-master/zh/docs/dev/table/config/#%E6%A6%82%E8%A7%88
        configuration.setString("execution.checkpointing.interval", "3 s");

        for (String path : DDL_PATH) {
            tEnv.executeSql(getTableSql(path));
        }
//        tEnv.executeSql("CREATE TABLE SourceTable (f0 String) with ('connector' = 'datagen','rows-per-second' = '1')");


        tEnv.executeSql("INSERT INTO table_a_sum SELECT * FROM table_a"
//                        + " UNION ALL SELECT * FROM table_a_1"
//                        + " UNION ALL SELECT * FROM table_a_2"
//                +" UNION ALL SELECT * FROM table_a_3"
                );
//        tEnv.sqlQuery("select * from SinkTable").printSchema();
//        env.execute();

    }
}
