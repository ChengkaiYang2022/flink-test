# SQL
```shell
CREATE TABLE UserScores (name STRING, score INT)
WITH (
'connector' = 'restful',
'path' = '/flink/table1',
'port' = '8081',
'format' = 'changelog-csv-v3',
'changelog-csv-v3.column-delimiter' = '|'
);

select * from UserScores;
```

```shell
POST
DELETE
PUT
```