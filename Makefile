all: build up

build:  
	docker compose -f srcs/docker-compose.yml build

up:
	docker compose -f srcs/docker-compose.yml up -d  

stop:
	docker compose -f srcs/docker-compose.yml stop

down:
	docker compose -f srcs/docker-compose.yml down

start:
	docker compose -f srcs/docker-compose.yml start

clean: down
	docker system prune -af --volumes

re: clean all

logs:
	docker compose -f srcs/docker-compose.yml logs -f