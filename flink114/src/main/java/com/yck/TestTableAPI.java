package com.yck;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.connector.datagen.table.DataGenConnectorOptions;
import org.apache.flink.table.api.*;


/**
 * This is Test for
 * code in
 * https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/dev/table/common/#structure-of-table-api-and-sql-programs *
 * (flink version 1.14)
 */
public class TestTableAPI {
    public static void main(String[] args) {
// Create a TableEnvironment for batch or streaming execution.
// See the "Create a TableEnvironment" section for details.
        EnvironmentSettings settings = EnvironmentSettings
                .newInstance()
                .inStreamingMode()
                //.inBatchMode()

                .build();

        TableEnvironment tableEnv = TableEnvironment.create(settings);
        Configuration configuration = tableEnv.getConfig().getConfiguration();
        configuration.setInteger("table.exec.resource.default-parallelism",1);

// Create a source table
        tableEnv.createTemporaryTable("SourceTable", TableDescriptor.forConnector("datagen")
                .schema(Schema.newBuilder()
                        .column("f0", DataTypes.STRING())
                        .build())
                .option(DataGenConnectorOptions.ROWS_PER_SECOND, 1L)
                .build());

// Create a sink table (using SQL DDL)
        // WILL WORK WITH (EXCLUDING OPTIONS)
//        tableEnv.executeSql("CREATE TEMPORARY TABLE SinkTable WITH ('connector' = 'print') LIKE SourceTable (EXCLUDING OPTIONS) ");
        // WILL NOT WORK WITHOUT (EXCLUDING OPTIONS)!
        tableEnv.executeSql("CREATE TEMPORARY TABLE SinkTable WITH ('connector' = 'blackhole') LIKE SourceTable ");

// Create a Table object from a Table API query
        Table table1 = tableEnv.from("SourceTable");

// Create a Table object from a SQL query
        Table table2 = tableEnv.sqlQuery("SELECT * FROM SourceTable");

// Emit a Table API result Table to a TableSink, same for SQL result
        TableResult tableResult = table1.executeInsert("SinkTable");
    }
}
