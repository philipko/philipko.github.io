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

docker search ubuntu
```

Dockerfile Project 
----------

[Dockerfile Project](http://dockerfile.github.io/)
