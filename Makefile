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
	docker run --name philipko.github.io -p8000:80 --rm -d -v $(shell pwd):/usr/share/nginx/html nginx:latest
