# SQL
```shell
CREATE TABLE UserScores (name STRING, score INT)
WITH (
'connector' = 'restful',
'url' = 'localhost',
'method' = 'POST',
'format' = 'changelog-json',
#'changelog-json.column-delimiter' = '|'
#'check-mode' = 'non-strict'
);

select * from UserScores;
```

```shell
POST
DELETE
PUT
```