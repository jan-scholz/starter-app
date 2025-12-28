include .env
APP_NAME ?= starter-app

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

clean-all: clean
	docker compose down -v --rmi all

run-prod:
	docker build -t $(APP_NAME) .
	docker run -d --rm --name $(APP_NAME)-prod -p 80:80 $(APP_NAME)

stop-prod:
	docker stop $(APP_NAME)-prod
