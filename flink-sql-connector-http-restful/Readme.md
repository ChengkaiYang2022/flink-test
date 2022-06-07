# SQL
```shell
CREATE TABLE UserScores (name STRING, score INT)
WITH (
'connector' = 'http-restful',
'path' = '/flink/table1',
'port' = '8080',
'format' = 'http-restful-json'
);
CREATE TABLE print_table  
(id STRING,score INT)
WITH ('connector' = 'print','sink.parallelism'='1','standard-error'='true') ;

insert into print_table select name,score from UserScores;
```

```shell
POST
DELETE
PUT
```