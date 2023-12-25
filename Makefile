all: up

up:
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@docker-compose -f ./srcs/docker-compose.yml start

status:
	@docker ps

clean:
	@docker-compose -f ./srcs/docker-compose.yml down --rmi all && docker system prune -a -f && sudo rm -rf /home/orakib/data/DB/* && sudo rm -rf /home/orakib/data/WordPress/*
