all: 
	mkdir -p /home/hboissel/data/transcendence
	@sudo docker compose -f ./srcs/docker-compose.yml build
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs transcendence

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

clean: stop
	@-sudo docker container stop transcendence

fclean: clean
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean
