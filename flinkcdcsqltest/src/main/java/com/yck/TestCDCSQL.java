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
    private static final String[] DDL_PATH = {
            "sql/table.sql",
            "sql/table_a_1.sql",
            "sql/table_a_2.sql",
            "sql/table_a_3.sql",
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
        // TODO 优化参数见 https://nightlies.apache.org/flink/flink-docs-master/zh/docs/dev/table/config/#%E6%A6%82%E8%A7%88
        configuration.setString("execution.checkpointing.interval", "3 s");

        for (String path : DDL_PATH) {
            tEnv.executeSql(getTableSql(path));
        }

        tEnv.executeSql("INSERT INTO table_a_sum " +
                        "SELECT concat('table_a',cast(a0.id as varchar),'-'),a0.ztid,a0.ztmc,'table_a' FROM table_a a0"
                        + " UNION ALL SELECT concat('table_a_1',cast(a1.id as varchar),'-'),a1.ztid,a1.ztmc,'table_a_1' FROM table_a_1 a1"
                        + " UNION ALL SELECT concat('table_a_2',cast(a2.id as varchar),'-'),a2.ztid,a2.ztmc,'table_a_2' FROM table_a_2 a2"
                        +" UNION ALL SELECT concat('table_a_3',cast(a3.id as varchar),'-'),a3.ztid,a3.ztmc,'table_a_3' FROM table_a_3 a3"
                );


    }
}
