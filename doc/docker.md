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

Docker: remove all containers by grep command
----------

```

docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
docker ps -a | grep rancher | cut -d ' ' -f 1 | xargs sudo docker rm -f

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

[Docker 資源分配](https://roy051023.github.io/2019/03/25/Limit-Docker/)


解決 Docker 造成 UFW 防火牆設定失效的方法
----------

習慣用下面第一行指令的方式來把 Container 的 port 給 Expose 到 Host，但是，比較安全且正確的作法應該是下第二行的方式，也就是要明確的把 IP 位址給指定出來哩 !
```
$ docker run -p 5984:5984 -d couchdb
$ docker run -p 127.0.0.1:5984:5984 -d couchdb
```

[解決 Docker 造成 UFW 防火牆設定失效的方法](https://www.arthurtoday.com/2016/08/ufw-is-not-working-with-docker.html)
[Docker 導致 UFW 設定失效](https://blog.36web.rocks/2016/07/08/docker-behind-ufw.html)
