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

