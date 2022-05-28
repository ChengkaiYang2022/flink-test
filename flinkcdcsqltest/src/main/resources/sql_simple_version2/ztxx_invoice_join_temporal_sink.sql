CREATE TABLE ztxx_invoice_join_temporal_sink (
                    database_name STRING ,
                    table_name STRING ,
               id INT NOT NULL,
               ztid STRING,
               fpid STRING,
               fpmc STRING,
                ztmc STRING,
    PRIMARY KEY (database_name, table_name, `id`) NOT ENFORCED
    )
 WITH (
   'connector' = 'jdbc',
   'url' = 'jdbc:mysql://192.168.56.101:3306/test_join__1?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT',
   'table-name' = 'ztxx_invoice_join_temporal_sink',
   'username' = 'root',
   'password' = '123456',
   'driver' = 'com.mysql.jdbc.Driver'
)