Mariadb Note
=======

get size of mysql database
----------

```
SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema
SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 / 1024 AS "Size (GB)" FROM information_schema.TABLES GROUP BY table_schema

```

[how-to-get-size-of-mysql-database](https://stackoverflow.com/questions/1733507/how-to-get-size-of-mysql-database)

create user & db 權限
----------

建立帳號，其中「myaccount」是帳號，「mypassword」是密碼，主機為 localhost。

```
CREATE USER 'myaccount'@'localhost' IDENTIFIED BY 'mypassword';

```

給予使用者 myaccount@localhost 存取資料庫 mydb 的所有權限（不含管理權限）：

```
GRANT ALL PRIVILEGES ON `mydb`.* TO 'myaccount'@'localhost';

```

權限修改完畢後，記得輸入 FLUSH PRIVILEGES; 重新載入權限，剛剛所做的異動才會生效。

```
flush privileges;

```


MySQL產生大量測試資料的方法
----------

```
這次還是搭配Memory Engine,速度可以較快,
但是將不會一下產生100萬筆,所以不需要先調高heap.

MySQL一般使用者,均能下SHOW GLOBAL STATUS,
亦即對 information_schema.GLOBAL_STATUS 有查詢的權限.
此Table的資料筆數隨著版本不同有差異,不過數量已經夠我們
用來產生測試資料的初始之用.

首先建立一個Table,使用Memory Engine.

CREATE TABLE hitofiller(
id INT UNSIGNED NOT NULL PRIMARY KEY
)ENGINE=Memory;

產生100筆基本的資料

INSERT INTO hitofiller(id)
SELECT @num := @num + 1
  FROM information_schema.GLOBAL_STATUS a
     , (SELECT @num := 0) b
 LIMIT 100;

Query OK, 100 rows affected (0.01 sec)
Records: 100  Duplicates: 0  Warnings: 0

直接利用hitofiller 增加自己的數量,到1萬筆.

INSERT INTO hitofiller(id)
SELECT @num := @num + 1
  FROM hitofiller a
     , (SELECT id
          FROM hitofiller
         LIMIT 99) b
     , (SELECT @num := 100) c;

Query OK, 9900 rows affected (0.02 sec)
Records: 9900  Duplicates: 0  Warnings: 0

檢查 hitofiller 的數值.

SELECT COUNT(1)
     , MAX(id)
     , MIN(id)
  FROM hitofiller;

+----------+---------+---------+
| COUNT(1) | MAX(id) | MIN(id) |
+----------+---------+---------+
|    10000 |   10000 |       1 |
+----------+---------+---------+

至此已經產生了1萬筆,遞增數列的資料.

應用範例:

例如要產生100萬筆的有日期型態的測試資料.

建立測試用的Table

CREATE TABLE hito_date(
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
sdate DATE NOT NULL);

INSERT INTO hito_date(sdate)
SELECT DATE_ADD('2014-01-01', INTERVAL RAND(20140312) * 364 DAY)
  FROM hitofiller a
  JOIN (SELECT id 
          FROM hitofiller 
         LIMIT 100) b;

Query OK, 1000000 rows affected (7.91 sec)
Records: 1000000  Duplicates: 0  Warnings: 0

檢查資料

SELECT COUNT(1) AS cnt
     , MIN(sdate)
     , MAX(sdate)
  FROM hito_date;

+---------+------------+------------+
| cnt     | MIN(sdate) | MAX(sdate) |
+---------+------------+------------+
| 1000000 | 2014-01-01 | 2014-12-31 |
+---------+------------+------------+

大約8秒的時間,就產生了100萬筆有日期型態的測試資料.
若需要其他型態的欄位,如數值,可自行使用RAND(),產生亂數,
適當增加即可.

```

[MySQL產生測試資料的方法之二](https://ithelp.ithome.com.tw/articles/10147387?sc=pt)


show open database connections
----------

SHOW STATUS WHERE `variable_name` = 'Max_used_connections';

```

mysql> show status like 'Conn%';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Connections   | 8     | 
+---------------+-------+
1 row in set (0.00 sec)


mysql> show status like '%onn%';
+--------------------------+-------+
| Variable_name            | Value |
+--------------------------+-------+
| Aborted_connects         | 0     | 
| Connections              | 8     | 
| Max_used_connections     | 4     | 
| Ssl_client_connects      | 0     | 
| Ssl_connect_renegotiates | 0     | 
| Ssl_finished_connects    | 0     | 
| Threads_connected        | 4     | 
+--------------------------+-------+
7 rows in set (0.00 sec)

```

[MySQL show status: How to show open database connections](https://alvinalexander.com/blog/post/mysql/how-show-open-database-connections-mysql)


MySQL show processlist
----------

```
mysql> show processlist;
+----+------+-----------------+--------+---------+------+-------+------------------+
| Id | User | Host            | db     | Command | Time | State | Info             |
+----+------+-----------------+--------+---------+------+-------+------------------+
|  3 | root | localhost       | webapp | Query   |    0 | NULL  | show processlist | 
|  5 | root | localhost:61704 | webapp | Sleep   |  208 |       | NULL             | 
|  6 | root | localhost:61705 | webapp | Sleep   |  208 |       | NULL             | 
|  7 | root | localhost:61706 | webapp | Sleep   |  208 |       | NULL             | 
+----+------+-----------------+--------+---------+------+-------+------------------+
4 rows in set (0.00 sec)

```

monitor Galera cluster status from command line
----------

```
SHOW STATUS LIKE 'wsrep%';

```

[How to monitor MariaDB Galera cluster status from command line](https://serverfault.com/questions/676048/how-to-monitor-mariadb-galera-cluster-status-from-command-line)
