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

#建立資料庫
use DATABASE_NAME

#檢視資料庫
show dbs

#刪除當前資料庫
db.dropDatabase()

#刪除集合
db.collectionName.drop()



#插入文件 insert() 或 save()
db.COLLECTION_NAME.insert(document)

ex:

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


#更新文件 update()，save()
db.collection.update(
   <query>,
   <update>,
   {
     upsert: <boolean>,
     multi: <boolean>,
     writeConcern: <document>
   }
)

#查詢文件 find()
db.collection.find(query, projection)

ex:

db.user_device.find()

db.user_device.find({"userid":"111111"})




```


[Mongodb 基本用法](https://www.itread01.com/content/1545639315.html)


Mongodb 查询指定时间范围的数据
----------

```
db.CollectionName.find({"whenCreated": {
    '$gte': ISODate("2018-03-06T13:10:40.294Z"),
    '$lt': ISODate("2018-05-06T13:10:40.294Z")
}});

db.things.find({"createTime":{"$gt":"2015-5-21 0:0:0"}}) // 大于某个时间
db.things.find({"createTime":{"$lt":"2014-5-21 0:0:0"}}) // 小于某个时间
db.things.find({"$and":[{"createTime":{"$gt":"2015-5-21 0:0:0"}},{"createTime":{"$lt":"2015-5-22 0:0:0"}}]}) // 某个时间段
```
[mongodb中字串日期的比較](https://www.itread01.com/content/1546274175.html)
[Mongodb 查询指定时间范围的数据](https://blog.csdn.net/u011368551/article/details/81219820)
[Find objects between two dates MongoDB](https://stackoverflow.com/questions/2943222/find-objects-between-two-dates-mongodb)
PHP sample code
----------

```
<?php
//連結mongodb
$manager = new MongoDB\Driver\Manager('mongodb://root:[email protected]:27017');
```

root 使用者；123：密碼；如果沒有密碼則不寫


查詢

```
<?php

//連結mongodb
$manager = new MongoDB\Driver\Manager('mongodb://root:[email protected]:27017');

//查詢
$filter =  ['user_id'=>['$gt'=>0]]; //查詢條件 user_id大於0
$options = [
   'projection' => ['_id' => 0], //不輸出_id欄位
   'sort' => ['user_id'=>-1] //根據user_id欄位排序 1是升序，-1是降序
];
$query = new MongoDB\Driver\Query($filter, $options); //查詢請求
$list = $manager->executeQuery('location.box',$query); // 執行查詢 location資料庫下的box集合


foreach ($list as $document) {
    print_r($document); 
}

```

新增

```
<?php

//連結mongodb
$manager = new MongoDB\Driver\Manager('mongodb://root:[email protected]:27017');

$bulk = new MongoDB\Driver\BulkWrite; //預設是有序的，序列執行
//$bulk = new MongoDB\Driver\BulkWrite(['ordered' => flase]);//如果要改成無序操作則加flase，並行執行
$bulk->insert(['user_id' => 2, 'real_name'=>'中國',]);
$bulk->insert(['user_id' => 3, 'real_name'=>'中國人',]);
$manager->executeBulkWrite('location.box', $bulk); //執行寫入 location資料庫下的box集合

```

修改

```
<?php

//連結mongodb
$manager = new MongoDB\Driver\Manager('mongodb://root:[email protected]:27017');

$bulk = new MongoDB\Driver\BulkWrite; //預設是有序的，序列執行
//$bulk = new MongoDB\Driver\BulkWrite(['ordered' => flase]);//如果要改成無序操作則加flase，並行執行
$bulk->update(
	['user_id' => 2],
	['$set'=>['real_name'=>'中國國']
]); 
//$set相當於mysql的 set，這裡和mysql有兩個不同的地方，
//1：欄位不存在會新增一個欄位;
//2：mongodb預設如果條件不成立，新增加資料，相當於insert


//如果條件不存在不新增加，可以通過設定upsert
//db.collectionName.update(query, obj, upsert, multi);

$bulk->update(
	['user_id' => 5],
	[
		'$set'=>['fff'=>'中國國']
	],
	['multi' => true, 'upsert' => false] 
	//multi為true,則滿足條件的全部修改,預設為true，如果改為false，則只修改滿足條件的第一條
	//upsert為 treu：表示不存在就新增
);
$manager->executeBulkWrite('location.box', $bulk); //執行寫入 location資料庫下的box集合
```
ordered 設定

1：預設是ture，按照順序執行插入更新資料，如果出錯，停止執行後面的，mongo官方叫序列。
2：如果是false，mongo併發的方式插入更新資料，中間出現錯誤，不影響後續操作無影響，mongo官方叫並行


刪除

```
<?php

//連結mongodb
$manager = new MongoDB\Driver\Manager('mongodb://root:[email protected]:27017');

$bulk = new MongoDB\Driver\BulkWrite; //預設是有序的，序列執行
//$bulk = new MongoDB\Driver\BulkWrite(['ordered' => flase]);//如果要改成無序操作則加flase，並行執行
$bulk->delete(['user_id'=>5]);//刪除user_id為5的欄位
$manager->executeBulkWrite('location.box', $bulk); //執行寫入 location資料庫下的box集合
```

delete還可以通過limit設定不同刪除方式

```
$bulk->delete(['user_id' => 1], ['limit' => 1]);   // limit 為 1 時，刪除第一條匹配資料
$bulk->delete(['user_id' => 2], ['limit' => 0]);   // limit 為 0 時，刪除所有匹配資料，預設刪除所有

```

[php7的mongodb基本用法](https://www.itread01.com/content/1545617347.html)



