all:	
	@-mkdir -p ../data
	/bin/bash srcs/config.sh
	@docker compose -f ./srcs/docker-compose.yml build
	@docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs front
	docker logs back

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

clean: stop
	@-docker container stop front back

fclean: clean
	@docker system prune -af
	@-docker volume rm srcs_transcendence

re: fclean all

afront:
	@docker attach front

aback:
	@docker attach back

front:
	@docker exec -it front /bin/bash

back:
	@docker exec -it back /bin/bash

.Phony: all logs clean fclean
