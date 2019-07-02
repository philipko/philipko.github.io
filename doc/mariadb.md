Mariadb Note
=======

get size of mysql database
----------
```
SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema
SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 / 1024 AS "Size (GB)" FROM information_schema.TABLES GROUP BY table_schema

```
![how-to-get-size-of-mysql-database](https://stackoverflow.com/questions/1733507/how-to-get-size-of-mysql-database)

create user
----------

* Grant user “testuser”, with password “testpassword” all access to the “testdb” database. Note: if you want to remotely access this database, replace ‘localhost’ with your remote address.
```
grant all privileges on testdb.* to testuser@'localhost' identified by 'testpassword';

```
* Flush MariaDB privileges


```
flush privileges;

```






