CREATE TABLE UserScores (name STRING, score INT)
WITH (
'connector' = 'socketv2',
'hostname' = 'localhost',
'port' = '9999',
'byte-delimiter' = '10',
'format' = 'changelog-csv',
'changelog-csv.column-delimiter' = '|'
);
select * from UserScores;