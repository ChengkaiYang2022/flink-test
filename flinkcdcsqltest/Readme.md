初步测试 Flink 支持分库分表合并到一张表内。

## 运行效果图：

四个mysql的分库分表数据如下：
![](img/sql_table_a_1.png)
![](img/sql_table_a_2.png)
![](img/sql_table_a.png)
![](img/sql_table_a_3.png)

写入同一张表如下：

![](img/sql_table_a_sum.png)

同时，标准输出捕获的CURD日志如下：

![](img/print_table_a_sum.png)

![](img/sql_table_a_curd.png)

## Step1. 准备Mysql测试数据
1. 开启 Mysql（5.7） 的 binlog 日志

在文件 /etc/my.cnf 增加如下配置
```text
[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M

log_bin=mysql-bin
binlog-format=ROW
server-id=1


```
2. 运行建表语句
建表语句与数据在 mysql 文件下。

## Step2. 在 Idea 中启动 flink 作业。


1. 添加 jar 包。
目前 flink-sql-connector-mysql-cdc-2.x.jar 还没有发布到maven仓库中，
可手动下载[jar包](https://ververica.github.io/flink-cdc-connectors/master/content/%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B/mysql-postgres-tutorial-zh.html#flink)，放入 Idea 的依赖中，如下图。

![](img/jar_idea.png)

2. 启动 flink 作业
可参考 src/main/java/com/yck/TestCDCSQLShardingTest.java