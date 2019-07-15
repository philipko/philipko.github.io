Mongodb Note
=======

mongo client
----------

```
docker exec -it mongo mongo

```
Docker Command
----------

```
docker pull mongo
docker run -d --name mongo --restart=always -p 27017:27017 -v  /path/datadir:/data/db mongo
```



SQL VS MongoDB 
----------


| SQL           | MongoDB       |
| ------------- |:-------------:|
| database      | database      |
| table         | collection    |
| row           | document      |
| column        | field         |

[MongoDB 基礎入門教學：MongoDB Shell 篇](https://blog.gtwang.org/programming/getting-started-with-mongodb-shell-1/)

mongo shell command
----------


```
db.user_device.insert(
  {
     "userid":"111111",
     "device_id":"iotdevice",
     "update_time":"2019-12-15 03:15:50"
  }
)


db.user_device.insert(
  {
     "userid":"222222",
     "device_id":"E0B94DFD5E29",
     "update_time":"2019-07-14 21:51:30"
  }
)


db.user_device.insert(
  {
     "userid":"333333",
     "device_id":"08EA402621EA",
     "update_time":"2019-07-15 03:02:25"
  }
)

db.user_device.find()

db.user_device.find({"userid":"111111"})

```
