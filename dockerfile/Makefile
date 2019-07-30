all: build

help:
	@echo "-- Help Menu"
	@echo "docker run --name mdwiki-nginx -p8000:80 --rm -d -v $(shell pwd):/usr/share/nginx/html nginx:latest"
ubuntu_1804_build:
	docker build -f Dockerfile_Ubuntu_18.04 . -t philip/ubuntu:18.04
ubuntu_1804_run:
	docker run -it -d --name philip_ubunut_18.04 philip/ubuntu:18.04
nodejs_build:
	docker build -f Dockerfile_Ubuntu_18.04_Nodejs . -t philip/nodejs
nodejs_run:
	docker run -it -d --name philip_nodejs philip/nodejs
