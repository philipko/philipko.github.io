Docker Note
=======




command
----------

```
#build
docker build -t nginx_php5_mongo:5.5.9 .
docker build -t you_tag_name:version .
docker build -t philip/ubuntu:18.04 .
docker build -f Dockerfile_Ubuntu_18.04 . -t philip/ubuntu:18.04


#run
docker run -it --rm dockerfile/ubuntu

docker run -it -d --rm --name philip_ubunut_18.04 philip/ubunut:18.04

#commit

docker commit -m "Added json gem" -a "Docker Newbee" 0b2616b0e5a8 ouruser/sinatra:v2
-m 指定提交的說明信息 -a 可以指定更新的使用者信息 之後是用來建立映像檔的容器的 ID；最後指定新映像檔的名稱和 tag 

docker search ubuntu

```

Dockerfile Project 
----------

[Dockerfile Project](http://dockerfile.github.io/)


remove an image tag in Docker without removing the image itself
----------

```

#example 

$ docker rmi my-image:0e5574283393
Untagged: my-image:0e5574283393

```

