all: build

help:
	@echo "-- Help Menu"

mdwiki_pull:
	docker pull claremontmckenna/mdwiki
mdwiki_run:
	docker run --name mdwiki -p 8000:80 --rm -d -v $(shell pwd):/md-app claremontmckenna/mdwiki
ngnix_pull:
	docker pull nginx
ngnix_run:
	docker run --name mdwiki-nginx -p8000:80 --rm -d -v $(shell pwd):/usr/share/nginx/html nginx:latest
philipko.github.io_run:
	docker run --name philipko.github.io --restart=always -p8000:80 -d -v $(shell pwd):/usr/share/nginx/html nginx:latest
philipko.github.io_clone:
	git clone https://philipko@github.com/philipko/philipko.github.io.git
	git clone https://philipkotw@bitbucket.org/philipkotw/philipko.github.io.git
