Rancher Note
=======


Case
---------

[通聯數據是如何使用Docker+Rancher構建自動發布管道的](https://www.itread01.com/content/1518322820.html)
[如何使用GitLab和Rancher構建CI/CD流水線](https://www.itread01.com/content/1549707859.html)
[Rancher 2.x 搭建及管理 Kubernetes 集群](https://blog.csdn.net/aixiaoyang168/article/details/88600530)


Install
---------

```
#for rancher 1.6
docker run -d --name rancher1.x --restart=always -p 8080:8080 rancher/server:stable
docker run -d --name rancher1.x --restart=unless-stopped -p 8080:8080 rancher/server:stable
#for rancher 2.x
docker run -d --name rancher --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:stable
docker run -d --name rancher2.x --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:stable
docker run -d --restart=unless-stopped -p 80:80 -p 443:443 -v /docker_volume/rancher_home/rancher:/var/lib/rancher -v /docker_volume/rancher_home/auditlog:/var/log/auditlog --name rancher rancher/rancher:stable

```

BIND MOUNT MYSQL VOLUME
---------

```
sudo docker run -d --name rancher -v <host_vol>:/var/lib/mysql --restart=unless-stopped -p 8080:8080 rancher/server:stable
sudo docker run -d --name rancher -v /home/dockerdata/rancher:/var/lib/mysql --restart=unless-stopped -p 80:80 -p 443:443 rancher/server:stable
```

[Rancher 1.6 Docs](https://rancher.com/docs/rancher/v1.6/en/installing-rancher/installing-server/#rancher-server-tags)
[Rancher 2.x Docs](https://rancher.com/docs/rancher/v2.x/en/)
[Docker決戰到底(三) Rancher2.x的安裝與使用 - 簡書](h[Rancher 2.x 搭建及管理 Kubernetes 集群]ttps://www.itread01.com/content/1558078697.html)

