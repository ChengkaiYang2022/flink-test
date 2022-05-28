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
public class TestCDCSQLShardingJoinTest {
    private static final Logger LOG = LoggerFactory.getLogger(TestCDCSQLTest.class);
    private static final String[] DDL_PATH = {
            // source 表
            "sql_simple_version/invoice.sql",
            "sql_simple_version/ztxx.sql",
            // sink 表
            "sql_simple_version/ztxx_sink.sql"
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
        // 2. 插入到print table  输出表

        tEnv.executeSql("CREATE TABLE ztxx_invoice_join_print_table " +
                "(id INT,ztid String, fpid String,fpmc String,ztmc String,database_name String,table_name String, PRIMARY KEY(id) NOT ENFORCED)" +
                "WITH ('connector' = 'print','sink.parallelism'='1','standard-error'='true')  ");
        tEnv.executeSql("INSERT INTO ztxx_invoice_join_print_table " +
                "SELECT a.id,a.ztid,a.fpid,a.fpmc,b.ztmc,a.database_name,a.table_name FROM invoice a left join ztxx b on a.ztid = b.ztid"
        );
//        // 3. 插入到mysql  输出表
//        tEnv.executeSql("INSERT INTO ztxx_sink " +
//                "SELECT database_name,table_name,id,ztid,ztmc FROM ztxx a0"
//        );
    }
}
