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






