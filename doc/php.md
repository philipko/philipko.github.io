PHP Note
=======



How do I get PHP errors to display?
----------

```
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

```

[How do I get PHP errors to display?](https://stackoverflow.com/questions/1053424/how-do-i-get-php-errors-to-display)


object_to_array
----------

```
function object_to_array($obj) {
    $obj = (array)$obj;
    foreach ($obj as $k => $v) {
        if (gettype($v) == 'resource') {
            return;
        }
        if (gettype($v) == 'object' || gettype($v) == 'array') {
            $obj[$k] = (array)object_to_array($v);
        }
    }

    return $obj;
}
```

[PHP陣列物件的轉換](https://www.itread01.com/content/1544065452.html)

array_to_object 
----------

```
function array_to_object($arr) {
    if (gettype($arr) != 'array') {
        return;
    }
    foreach ($arr as $k => $v) {
        if (gettype($v) == 'array' || getType($v) == 'object') {
            $arr[$k] = (object)array_to_object($v);
        }
    }

    return (object)$arr;
}
```
[PHP陣列物件的轉換](https://www.itread01.com/content/1544065452.html)


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

