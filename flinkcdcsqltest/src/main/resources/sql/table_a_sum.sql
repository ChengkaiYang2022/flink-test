CREATE TABLE table_a_sum (
               id STRING NOT NULL,
                ztid STRING,
                ztmc STRING,
                source STRING,
                 PRIMARY KEY(id) NOT ENFORCED
) WITH (
   'connector' = 'jdbc',
   'url' = 'jdbc:mysql://192.168.56.101:3306/test1?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT',
   'table-name' = 'table_a_sum',
   'username' = 'root',
   'password' = '123456',
   'driver' = 'com.mysql.jdbc.Driver'
)