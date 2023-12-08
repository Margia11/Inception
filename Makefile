all:
	@sudo hostsed add 127.0.0.1 amargiac.42.fr && echo "successfully added amargiac.42.fr to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@sudo hostsed rm 127.0.0.1 amargiac.42.fr && echo "successfully removed amargiac.42.fr to /etc/hosts"
	@if [ -d "/home/amargiac/data/wordpress" ]; then \
	sudo rm -rf /home/amargiac/data/wordpress/* && \
	echo "successfully removed all contents from /home/amargiac/data/wordpress/"; \
	fi;

	@if [ -d "/home/amargiac/data/mariadb" ]; then \
	sudo rm -rf /home/amargiac/data/mariadb/* && \
	echo "successfully removed all contents from /home/amargiac/data/mariadb/"; \
	fi;

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, clean, fclean, re, ls
