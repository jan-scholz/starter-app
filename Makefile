.PHONY: build up down clean clean-all run-prod stop-prod

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

clean:
	rm -rf frontend/dist
	rm -rf frontend/node_modules

clean-all:
	docker compose down -v --rmi all
	rm -rf frontend/dist
	rm -rf frontend/node_modules

run-prod:
	docker build -t starter-app .
	docker run -d --rm --name starter-app-prod -p 80:80 starter-app

stop-prod:
	docker stop starter-app-prod
