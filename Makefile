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

dokuwiki_run:
	#login user:superuser password:bitnami1
	docker run -d -p 80:80 -p 443:443 --restart=always --name dokuwiki -v $(shell pwd)/wiki:/bitnami bitnami/dokuwiki:latest
dokuwiki_symbolic_link_pages:
	rm -rf wiki/dokuwiki/data/pages
	cd ./wiki/dokuwiki/data;ln -s ../../pages pages

