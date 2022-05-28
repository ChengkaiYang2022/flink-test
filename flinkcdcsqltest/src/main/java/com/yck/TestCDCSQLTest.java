package com.yck;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.TableEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static com.yck.FlinkTableTools.getTableDDL;

public class TestCDCSQLTest {
    private static final Logger LOG = LoggerFactory.getLogger(TestCDCSQLTest.class);
    private static final String[] DDL_PATH = {
            // 4个分库分表
            "sql_demo_version/table.sql",
            "sql_demo_version/table_a_1.sql",
            "sql_demo_version/table_a_2.sql",
            "sql_demo_version/table_a_3.sql",
            // 结果表
            "sql_demo_version/table_a_sum.sql"
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
        // 2. union all 合并到 结果表，保存到mysql
        tEnv.executeSql("INSERT INTO table_a_sum " +
                        "SELECT concat('table_a',cast(a0.id as varchar)),a0.ztid,a0.ztmc,'table_a' FROM table_a a0"
                        + " UNION ALL SELECT concat('table_a_1',cast(a1.id as varchar)),a1.ztid,a1.ztmc,'table_a_1' FROM table_a_1 a1"
                        + " UNION ALL SELECT concat('table_a_2',cast(a2.id as varchar)),a2.ztid,a2.ztmc,'table_a_2' FROM table_a_2 a2"
                        +" UNION ALL SELECT concat('table_a_3',cast(a3.id as varchar)),a3.ztid,a3.ztmc,'table_a_3' FROM table_a_3 a3"
                );
        // 3. union all 合并到 结果表，输出到命令行
        tEnv.executeSql("CREATE TABLE print_table " +
                "(id String,ztid String, ztdm String,source String,PRIMARY KEY(id) NOT ENFORCED)" +
                "WITH ('connector' = 'print','sink.parallelism'='1','standard-error'='true')  ");

        tEnv.executeSql("INSERT INTO print_table " +
                "SELECT concat('table_a-',cast(a0.id as varchar)),a0.ztid,a0.ztmc,'table_a' FROM table_a a0"
                + " UNION ALL SELECT concat('table_a_1-',cast(a1.id as varchar)),a1.ztid,a1.ztmc,'table_a_1' FROM table_a_1 a1"
                + " UNION ALL SELECT concat('table_a_2-',cast(a2.id as varchar)),a2.ztid,a2.ztmc,'table_a_2' FROM table_a_2 a2"
                +" UNION ALL SELECT concat('table_a_3-',cast(a3.id as varchar)),a3.ztid,a3.ztmc,'table_a_3' FROM table_a_3 a3"
        );
    }
}
