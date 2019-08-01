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
ubuntu_1604_tensorflow_cpu_build:
	docker build -f Dockerfile_Ubuntu_16.04_Tensorflow_CPU . -t philip/tensorflow_cpu:1.6
ubuntu_1604_tensorflow_cpu_run:
	#docker run -it -d  -p6006:6006 -p8888:8888 -p2222:22 --name philip_tensorflow_cpu philip/tensorflow_cpu:1.6
	docker run -it -d  -p6006:6006 -p8888:8888 --name philip_tensorflow_cpu philip/tensorflow_cpu:1.6
ubuntu_1604_tensorflow_gpu_build:
	docker build -f Dockerfile_Ubuntu_16.04_Tensorflow_GPU . -t philip/tensorflow_gpu


