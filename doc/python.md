Python Note
=======


Anaconda
----------

```
#安裝package
conda install packageName
conda install pandas

#要移除package
conda remove packeName

#安裝特定版本的python
conda install python=3.5


conda create -n envName
```
[Anaconda環境安裝](https://ithelp.ithome.com.tw/articles/10192460)
[用conda建立及管理python虛擬環境](https://medium.com/python4u/%E7%94%A8conda%E5%BB%BA%E7%AB%8B%E5%8F%8A%E7%AE%A1%E7%90%86python%E8%99%9B%E6%93%AC%E7%92%B0%E5%A2%83-b61fd2a76566)



dict[x]後串接list()
----------

```
#initialize
d = {}
d[key] = list()
d[key].append(value)

#check
if key not in d:
    d[key] = list()
d[key].append(value)

#setdefault
d.setdefault(t,list()).append( c )
```


[dict[x]後串接list()](http://lucaswei.blogspot.com/2012/05/pythondictxlist.html)



a Python equivalent of PHP's var_dump()
----------

```
def var_dump(var, prefix=''):
    """
    You know you're a php developer when the first thing you ask for
    when learning a new language is 'Where's var_dump?????'
    """
    my_type = '[' + var.__class__.__name__ + '(' + str(len(var)) + ')]:'
    print(prefix, my_type, sep='')
    prefix += '    '
    for i in var:
        if type(i) in (list, tuple, dict, set):
            var_dump(i, prefix)
        else:
            if isinstance(var, dict):
                print(prefix, i, ': (', var[i].__class__.__name__, ') ', var[i], sep='')
            else:
                print(prefix, '(', i.__class__.__name__, ') ', i, sep='')

```

[What is a Python equivalent of PHP's var_dump()?](https://stackoverflow.com/questions/383944/what-is-a-python-equivalent-of-phps-var-dump)


Python Nested Dictionary
----------

```
nested_dict = { 'dictA': {'key_1': 'value_1'},
                'dictB': {'key_2': 'value_2'}}



#Something like this could help:

def nested_set(dic, keys, value):
    for key in keys[:-1]:
        dic = dic.setdefault(key, {})
    dic[keys[-1]] = value

#And you can use it like this:

>>> d = {}
>>> nested_set(d, ['person', 'address', 'city'], 'New York')
>>> d
{'person': {'address': {'city': 'New York'}}}

```

[Python Nested Dictionary](https://www.geeksforgeeks.org/python-nested-dictionary/)
[Setting a value in a nested python dictionary given a list of indices and value](https://stackoverflow.com/questions/13687924/setting-a-value-in-a-nested-python-dictionary-given-a-list-of-indices-and-value)



Extract file name from path, no matter what the os/path format
----------

```
import os
path_str = "c:\\var\www\index.html"
print(os.path.basename(path_str))
```

[Extract file name from path, no matter what the os/path format](https://stackoverflow.com/questions/8384737/extract-file-name-from-path-no-matter-what-the-os-path-format)
