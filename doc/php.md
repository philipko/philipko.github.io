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




