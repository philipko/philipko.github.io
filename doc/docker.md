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

#login
docker login
#logout
docker logut

#commit

docker commit -m "Added json gem" -a "Docker Newbee" 0b2616b0e5a8 ouruser/sinatra:v2
-m 指定提交的說明信息 -a 可以指定更新的使用者信息 之後是用來建立映像檔的容器的 ID；最後指定新映像檔的名稱和 tag 

#docker pull/push  and private docker registry
docker pull ubuntu:14.04
docker tag ubuntu:14.04 localhost:5000/ubuntu:14.04
or
docker tag <imageid> localhost:5000/ubuntu:14.04

docker search ubuntu

```

Docker: remove all containers by grep command
----------

```

docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
docker ps -a | grep rancher | cut -d ' ' -f 1 | xargs sudo docker rm -f
docker ps -a | grep Exited | awk '{print $1}'|xargs docker rm

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

solution1

習慣用下面第一行指令的方式來把 Container 的 port 給 Expose 到 Host，但是，比較安全且正確的作法應該是下第二行的方式，也就是要明確的把 IP 位址給指定出來哩 !
```
$ docker run -p 5984:5984 -d couchdb
$ docker run -p 127.0.0.1:5984:5984 -d couchdb
```

[解決 Docker 造成 UFW 防火牆設定失效的方法](https://www.arthurtoday.com/2016/08/ufw-is-not-working-with-docker.html)


solution2

docker的預設埠是2376如果TLS啟用，如果沒有啟動則是2375,會話是不加密的。預設情況，docker執行在沒有TLS啟動的情況下。
開啟 /etc/default/ufw 並修改 DEFAULT_FORWARD_POLICY 為 ACCEPT
```
sudo vi /etc/default/ufw
DEFAULT_FORWARD_POLICY="ACCEPT"
ufw allow 2375/tcp #allow port 2375 的連線
ufw reload #重新載入 UFW 設定


#Ubuntu：修改 /etc/default/docker ，在 DOCKER_OPTS 加上 --iptables=false
sudo vi /etc/default/docker 命令并添加以下命令：
DOCKER_OPTS="--iptables=false"

service docker restart#重啟 Docker service
#sudo systemctl restart docker


開啟 /etc/ufw/before.rules 並在 *filter 前加上
/etc/ufw/before.rules
*nat
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING ! -o docker0 -s 172.17.0.0/16 -j MASQUERADE
COMMIT

```

[Docker 導致 UFW 設定失效](https://blog.36web.rocks/2016/07/08/docker-behind-ufw.html)
[Ubuntu16.04安裝docker](https://codertw.com/%E4%BC%BA%E6%9C%8D%E5%99%A8/160557/)
[只需一行代码，轻松解决Docker 和UFW 防火墙的安全漏洞](https://blog.csdn.net/dt763C/article/details/79179321)

建立 private 的 Docker Registry
----------


```

docker run -d -p 5000:5000 --restart=always --name registry -v $(pwd)/data:/var/lib/registry registry:2
docker run -d -p 5001:80 -e ENV_DOCKER_REGISTRY_HOST=172.16.35.13 -e ENV_DOCKER_REGISTRY_PORT=5000 konradkleine/docker-registry-frontend:v2

docker pull ubuntu:14.04
docker tag ubuntu:14.04 localhost:5000/ubuntu:14.04
or
docker tag <imageid> localhost:5000/ubuntu:14.04

docker push localhost:5000/ubuntu:14.04

#Docker private registry : How to list all images
curl http://XXXXXXX:5000/v2/_catalog
#get all image tags
curl http://XXXXXXX:5000/v2/ubuntu/tags/list


```

該命令實際上相當於 $ sudo docker pull registry.hub.docker.com/ubuntu:12.04 命令，即從註冊服務器 registry.hub.docker.com 中的 ubuntu 倉庫來下載標記為 12.04 的映像檔。

[建立自己的 Docker Registry](https://k2r2bai.com/2016/01/02/container/docker-registry/)
[Day7：建立 private 的 Docker Registry](https://ithelp.ithome.com.tw/articles/10191213)
[Deploy a registry server](https://docs.docker.com/registry/deploying/)
[Docker private registry : How to list all images](https://forums.docker.com/t/docker-private-registry-how-to-list-all-images/21136/9)

Docker repository server gave HTTP response to HTTPS client
----------

```
#vi 
/etc/docker/daemon.json
#add
{ "insecure-registries":["host:port"] } 
#In my case, those(host:port) are 192.168.99.1:50000
sudo service docker restart
```

[Docker repository server gave HTTP response to HTTPS client](https://stackoverflow.com/questions/49674004/docker-repository-server-gave-http-response-to-https-client)


 Start containers automatically(Use a restart policy)
----------

```
docker run -dit --restart unless-stopped redis
```


[Start containers automatically](https://docs.docker.com/config/containers/start-containers-automatically/)
