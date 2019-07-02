
Mariadb Note
=======

get size of mysql database
----------

SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema
SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 / 1024 AS "Size (GB)" FROM information_schema.TABLES GROUP BY table_schema
![](https://stackoverflow.com/questions/1733507/how-to-get-size-of-mysql-database)


