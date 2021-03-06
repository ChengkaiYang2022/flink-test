package com.yck;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.TableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static com.yck.FlinkTableTools.getTableDDL;

/**
 * 测试使用一张 Flink 实现分库分表，读取16张分表 ztxx，以及 读取16张分表 invoice，
 * 按照 ztxx 关联，写入到
 * 插入到 ztxx_invoice_join_print_table 标准输出 和 mysql 结果表 ztxx_invoice_join_sink
 * 对应 test_2.ztxx_invoice_join
 * TODO 直接left join，全缓存，慎用！
 * 参考
 * https://ververica.github.io/flink-cdc-connectors/master/content/%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B/build-real-time-data-lake-tutorial-zh.html
 */
public class TestCDCSQLShardingEventTemporalJoinTest {
    private static final Logger LOG = LoggerFactory.getLogger(TestCDCSQLTest.class);
    private static final String[] DDL_PATH = {
            // source 表
            "sql_simple_version2/invoice.sql",
            "sql_simple_version2/ztxx.sql",
            // sink 表
            "sql_simple_version2/ztxx_invoice_join_temporal_sink.sql"
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
        configuration.setString("table.local-time-zone", "Asia/Shanghai");
        // 1. 将分库分表的4张mysql表映射到flink的元数据中
        for (String path : DDL_PATH) {
            tEnv.executeSql(getTableDDL(path));
        }

        // 2. 插入到print table  输出表

//        tEnv.executeSql("CREATE TABLE ztxx_print_table " +
//                "(id INT,ztid String, ztmc String,database_name String,table_name String,update_time TIMESTAMP_LTZ(3), PRIMARY KEY(id) NOT ENFORCED)" +
//                "WITH ('connector' = 'print','sink.parallelism'='1','standard-error'='true')  ");
//        tEnv.executeSql("INSERT INTO ztxx_print_table " +
//                "SELECT id,ztid,ztmc,database_name,table_name,update_time FROM ztxx a0"
//        );
        tEnv.executeSql("CREATE TABLE ztxx_invoice_join_print_table " +
                "(id INT,ztid String, fpid String,fpmc String,ztmc String,database_name String,table_name String, PRIMARY KEY(id) NOT ENFORCED)" +
                "WITH ('connector' = 'print','sink.parallelism'='1','standard-error'='true')  ");
        tEnv.executeSql("INSERT INTO ztxx_invoice_join_print_table " +
                "SELECT invoice.id,invoice.ztid,invoice.fpid," +
                "invoice.fpmc,ztxx.ztmc,invoice.database_name,invoice.table_name " +
                "FROM invoice " +
                "left join ztxx " +
                "FOR SYSTEM_TIME AS OF invoice.update_time " +
                " on invoice.id = ztxx.id"
        );
    }
}
