CREATE TABLE table_a_sum (
               id INT NOT NULL,
                ztid STRING,
                ztmc STRING,
                 PRIMARY KEY(id) NOT ENFORCED
) WITH (
 'connector' = 'mysql-cdc',
 'hostname' = '192.168.56.101',
 'port' = '3306',
 'username' = 'root',
 'password' = '123456',
 'database-name' = 'test1',
 'table-name' = 'table_a_sum'
)