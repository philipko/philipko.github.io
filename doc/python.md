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

Python Virtual Environment
----------

```
sudo apt-get install python3-venv python3-dev libxml2-dev libxslt1-dev zlib1g-dev libffi-dev libssl-dev

#建置自己的虛擬環境、名稱
pyvenv myenv # 建置虛擬環境名叫 myenv
or python3.6 -m venv /home/user/myenv

#進入自己建置的虛擬開發環境
source myenv/bin/activate # 進入此環境
(myenv) $ # 於此就進入此環境了

#於虛擬開發環境安裝套件
pip install Scrapy # 若有需要安裝套件，可在此環境安裝
#退出虛擬開發環境
deactivate

```
[Python3 虛擬環境 venv 建置步驟](https://blog.longwin.com.tw/2016/08/python-virtualenv-venv-build-2016/)
[How to Setup Python Virtual Environment on Ubuntu 18.04](https://linoxide.com/linux-how-to/setup-python-virtual-environment-ubuntu/)

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



python date & time string
----------

```
from datetime import datetime

now = datetime.now()
now_str = now.strftime("%Y%m%d%H%M%S")
```


Handle urllib's timeout and other errors  in Python 3
----------

```
import urllib.request as request
try:
    response = request.urlopen('http://google.com',timeout = 0.001)
    print(response)
except request.URLError as err:
    print('got here')
    # urllib.URLError: <urlopen error timed out>



import urllib.request
import urllib.error

url = ['http://www.pcbeta.com/a.html',
       'http://b.con']
try:
    a = urllib.request.urlopen(url[0])
except urllib.error.HTTPError as e:  # 此时是HTTPError
    print(e.code)
except urllib.error.URLError as e:  # 此时是URLError
    print(e.reason)


```

[How to handle urllib's timeout in Python 3](https://stackoverflow.com/questions/8763451/how-to-handle-urllibs-timeout-in-python-3)

Handling API errors using Python requests
----------

```
try:
  response = requests.post(_url, files={'file': some_file})
  response.raise_for_status()
except requests.exceptions.HTTPError as errh:
  return "An Http Error occurred:" + repr(errh)
except requests.exceptions.ConnectionError as errc:
  return "An Error Connecting to the API occurred:" + repr(errc)
except requests.exceptions.Timeout as errt:
  return "A Timeout Error occurred:" + repr(errt)
except requests.exceptions.RequestException as err:
  return "An Unknown Error occurred" + repr(err)

```

[Handling API errors using Python requests](https://www.secopshub.com/t/handling-api-errors-using-python-requests/589/1)



Linux 如何於 Crontab 執行 Python Virtualenv 環境
----------

```
SHELL=/bin/bash
/10 * * * * source /project/venv/bin/activate && /project/bin/exec.py args
```
[Linux 如何於 Crontab 執行 Python Virtualenv 環境](https://blog.longwin.com.tw/2019/03/linux-crontab-python-virtualenv-env-2019/)
[Cron and virtualenv](https://stackoverflow.com/questions/3287038/cron-and-virtualenv)


python3 import 
----------

其中 m1.m1 的部分，第一個 m1 指的是這個 package，你也可以想成就是指 m1 這個資料夾。第二個 m1 指的則是這個 package 中的 module 的 m1 檔案。最後一個 foo 則是我們要從檔案中 import 的 funcion, class 或變數。


```
import_example
├── m1
│   ├── __init__.py
│   └── m1.py
└── main.py


#for m1.py
def foo():
    print('I am foo in m1')

#for main.py

from m1.m1 import foo
if __name__ == '__main__':
    foo()

```
[Python import 簡易教學](https://medium.com/@alan81920/python-import-%E7%B0%A1%E6%98%93%E6%95%99%E5%AD%B8-c98e8e2553d3)
[Python 的 Import 陷阱](https://medium.com/pyladies-taiwan/python-%E7%9A%84-import-%E9%99%B7%E9%98%B1-3538e74f57e3)
[Better place to put common functions?](https://stackoverflow.com/questions/37127201/better-place-to-put-common-functions)



importing multiple functions from a Python module
----------

```
ex:
from my_module import function1, function2, function3, function4, function5, function6, function7
from my_module import *
```

[importing multiple functions from a Python module](https://stackoverflow.com/questions/6761825/importing-multiple-functions-from-a-python-module)
[import雜談之二———export機制以及namespace package](https://ithelp.ithome.com.tw/articles/10196775?sc=iThelpR)

