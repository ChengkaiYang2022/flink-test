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

import static com.yck.FlinkTableTools.getTableDDL;

/**
 * 测试使用一张 Flink 实现分库分表
 * 参考
 * https://ververica.github.io/flink-cdc-connectors/master/content/%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B/build-real-time-data-lake-tutorial-zh.html
 */
public class TestCDCSQLSimpleVersion {
    private static final Logger LOG = LoggerFactory.getLogger(TestCDCSQL.class);
    private static final String[] DDL_PATH = {
            // 4个分库分表
            "sql_simple_version/invoice.sql",
            "sql_simple_version/ztxx.sql"
    };

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
        // 1. 将分库分表的4张mysql表映射到flink的元数据中
        for (String path : DDL_PATH) {
            tEnv.executeSql(getTableDDL(path));
        }

        tEnv.executeSql("CREATE TABLE ztxx_print_table " +
                "(id INT,ztid String, ztmc String,database_name String,table_name String, PRIMARY KEY(id) NOT ENFORCED)" +
                "WITH ('connector' = 'print','sink.parallelism'='1','standard-error'='true')  ");
        tEnv.executeSql("INSERT INTO ztxx_print_table " +
                "SELECT id,ztid,ztmc,database_name,table_name FROM ztxx a0"
        );
    }
}
