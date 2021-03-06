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


SQL query 對應 mongodb 的表格 
----------



[mongodb group by](https://mlwmlw.org/2015/03/mongodb-group-by/)
[SQL query 對應 mongodb 的表格 ](https://nosqlbooster.com/featuresForSQL)


MongoDB GroupBy操作， 結果集大小限制問題
----------

[MongoDB GroupBy操作， 結果集大小限制問題](https://codertw.com/%E8%B3%87%E6%96%99%E5%BA%AB/11111/)





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
db.CollectionName.find({"whenCreated": {'$gte': ISODate("2018-03-06T13:10:40.294Z"),'$lt': ISODate("2018-05-06T13:10:40.294Z")}});
db.CollectionName.find({"timestamp": {'$gte': "2019-07-17 00:00:00",'$lt': "2019-07-17 23:12:59"}})
db.user_device_log_201907.find({"userid":"XXXXXXXXXXX","timestamp": {'$gte': "2019-07-16 00:00:00",'$lt': "2019-07-16 23:59:59"}})

db.things.find({"createTime":{"$gt":"2015-5-21 0:0:0"}}) // 大于某个时间
db.things.find({"createTime":{"$lt":"2014-5-21 0:0:0"}}) // 小于某个时间
db.things.find({"$and":[{"createTime":{"$gt":"2015-5-21 0:0:0"}},{"createTime":{"$lt":"2015-5-22 0:0:0"}}]}) // 某个时间段
```
[mongodb中字串日期的比較](https://www.itread01.com/content/1546274175.html)
[Mongodb 查询指定时间范围的数据](https://blog.csdn.net/u011368551/article/details/81219820)
[Find objects between two dates MongoDB](https://stackoverflow.com/questions/2943222/find-objects-between-two-dates-mongodb)


How to query mongodb Date using php
----------


```
$startOfDay=date('Y-m-d',strtotime('2013-09-02 12:21:55'))
$endOfDay=date('Y-m-d',strtotime('2013-09-02 12:21:55'))

// Both points/seconds inclusive
->find(array("date" => array('$gte' => $startOfDay, '$lte' => $endOfDay)));
// Both seconds exclusive
->find(array("date" => array('$gt' => $startOfDay, '$lt' => $endOfDay)));

```

[How to query mongodb Date using php](https://stackoverflow.com/questions/19207222/how-to-query-mongodb-date-using-php)


search for documents where 5 < x < 20
----------

```
$rangeQuery = array('x' => array( '$gt' => 5, '$lt' => 20 ));

```
or above example the answer comes to be:

```
$rangeQuery = ['avg' => ['$gt' => '50' ]];
$rs=$collection->find($rangeQuery);
```



update duplicated documents in MongoDB?
----------

[How to update duplicated documents in MongoDB?](https://stackoverflow.com/questions/49616440/how-to-update-duplicated-documents-in-mongodb)



Insert on duplicate key update using MongoDB
----------

[Insert on duplicate key update using MongoDB](https://dba.stackexchange.com/questions/208056/insert-on-duplicate-key-update-using-mongodb)


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


如何在PHP和MongoDB中正确捕捉异常
----------

```
<?php 

try { 

    $mng = new MongoDB\Driver\Manager("mongodb://localhost:2717"); 
    $query = new MongoDB\Driver\Query([], ['sort' => [ 'name' => 1], 'limit' => 5]);  

    $rows = $mng->executeQuery("testdb.cars", $query); 

    foreach ($rows as $row) { 

     echo "$row->name : $row->price\n"; 
    } 

} catch (MongoDB\Driver\Exception\Exception $e) { 

    $filename = basename(__FILE__); 

    echo "The $filename script has experienced an error.\n"; 
    echo "It failed with the following exception:\n"; 

    echo "Exception:", $e->getMessage(), "\n"; 
    echo "In file:", $e->getFile(), "\n"; 
    echo "On line:", $e->getLine(), "\n";  
} 

?> 

```

[如何在PHP和MongoDB中正确捕捉异常](http://cn.voidcc.com/question/p-nmwglrzr-ct.html)


