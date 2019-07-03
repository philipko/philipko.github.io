all: build

help:
	@echo "-- Help Menu"

mdwiki_pull:
	docker pull claremontmckenna/mdwiki
mdwiki_run:
	docker run --name mdwiki -p 8000:80 --rm -d -v $(shell pwd):/md-app claremontmckenna/mdwiki
