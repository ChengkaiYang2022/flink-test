CREATE TABLE ztxx (
               id INT NOT NULL,
                ztid STRING,
                ztmc STRING,
                database_name STRING METADATA VIRTUAL,
                table_name STRING METADATA VIRTUAL,
                    update_time TIMESTAMP(3),

                WATERMARK FOR update_time AS update_time - INTERVAL '10' SECOND,
                PRIMARY KEY(id) NOT ENFORCED
) WITH (
 'connector' = 'mysql-cdc',
 'hostname' = '192.168.56.101',
 'port' = '3306',
 'username' = 'root',
 'password' = '123456',
 'database-name' = 'test_join_[0-9]+',
 'table-name' = 'ztxx_[0-9]+'
)