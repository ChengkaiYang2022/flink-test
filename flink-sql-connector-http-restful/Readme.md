# SQL
```shell
CREATE TABLE UserScores (name STRING, score INT)
WITH (
'connector' = 'restful',
'path' = '/flink/table1',
'port' = '8081',
'format' = 'restful-json'
);

select * from UserScores;
```

```shell
POST
DELETE
PUT
```