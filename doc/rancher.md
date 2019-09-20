Rancher Note
=======

Install
=======

```
#for rancher 1.6
docker run -d --name rancher --restart=always -p 8080:8080 rancher/server:stable
#for rancher 2.x
docker run -d --name rancher --restart=always -p 8080:8080 rancher/rancher:stable

```

LAUNCHING RANCHER SERVER - SINGLE CONTAINER - BIND MOUNT MYSQL VOLUME
=======

```
sudo docker run -d --name rancher -v <host_vol>:/var/lib/mysql --restart=unless-stopped -p 8080:8080 rancher/server:stable
sudo docker run -d --name rancher -v /home/dockerdata/rancher:/var/lib/mysql --restart=unless-stopped -p 8080:8080 rancher/server:stable
```

[Rancher 1.6 Docs](https://rancher.com/docs/rancher/v1.6/en/installing-rancher/installing-server/#rancher-server-tags)
[Rancher 2.x Docs](https://rancher.com/docs/rancher/v2.x/en/)
[Rancher - 管理內部及外部 (Azure) Docker Cluster 的好工具](https://columns.chicken-house.net/2016/04/29/rancher-on-azure-lab/)
