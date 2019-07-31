all: build

help:
	@echo "-- Help Menu"
	@echo "docker run --name mdwiki-nginx -p8000:80 --rm -d -v $(shell pwd):/usr/share/nginx/html nginx:latest"
	@echo "docker run --name mdwiki-nginx -p8000:80 --restart=always --network ogacloud_default --rm -d -v $(shell pwd):/usr/share/nginx/html nginx:latest"
ubuntu_1804_build:
	docker build -f Dockerfile_Ubuntu_18.04 . -t philip/ubuntu:18.04
ubuntu_1804_run:
	docker run -it -d --name philip_ubunut_18.04 philip/ubuntu:18.04
nodejs_build:
	docker build -f Dockerfile_Ubuntu_18.04_Nodejs . -t philip/nodejs
nodejs_run:
	docker run -it -d --name philip_nodejs philip/nodejs
nodejs_adminator_run:
	docker run -it -d -p3000:3000 --name philip_nodejs_adminator philip/nodejs_adminator:1.0.0
nodejs_adminlte_run:
	docker run -it -d -v $(shell pwd):/home/AdminLTE -p4000:80 --name philip_nodejs_adminlte philip/nodejs_adminlte

