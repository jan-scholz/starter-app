.PHONY: build up down clean

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

clean:
	docker compose down -v --rmi all
	rm -rf frontend/dist
	rm -rf frontend/node_modules
