all: 
	mkdir -p /home/hboissel/data/transcendence
	@docker compose -f ./srcs/docker-compose.yml build
	@docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs transcendence

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

clean: stop
	@-docker container stop transcendence

fclean: clean
	@docker system prune -af
	@-docker volume rm srcs_transcendence

re: fclean all

debug:
	docker run -it transcendence /bin/bash

.Phony: all logs clean fclean
