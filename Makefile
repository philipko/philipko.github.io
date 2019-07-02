all: build

help:
	@echo "-- Help Menu"

mdwiki:
	docker pull claremontmckenna/mdwiki
	docker run --name mdwiki -p 8000:80 --rm -d -v $(shell pwd):/md-app claremontmckenna/mdwiki
