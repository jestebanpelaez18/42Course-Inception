#Start and build docker compose service, then start the containers
#FILES_PATH = /Users/jpelaez-/data
FILES_PATH = /home/jpelaez-/data #virtual machine
all:
	@if [ ! -d "$(FILES_PATH)/mariadb" ]; then \
		sudo mkdir -p $(FILES_PATH)/mariadb; \
		sudo chmod -R 777 $(FILES_PATH)/mariadb; \
	fi
	@if [ ! -d "$(FILES_PATH)/wordpress" ]; then \
		sudo mkdir -p $(FILES_PATH)/wordpress; \
		sudo chmod -R 777 $(FILES_PATH)/wordpress; \
	fi
	@if ! grep -q "jpelaez-.42.fr" /etc/hosts; then \
		sudo chmod 777 /etc/hosts; \
		echo "127.0.0.1 jpelaez-.42.fr" >> /etc/hosts; \
	fi
	@if ! grep -q "jpelaez-.42.fr" /etc/hosts; then \
		sudo chmod 777 /etc/hosts; \
		echo "127.0.0.1 jpelaez-.42.fr" >> /etc/hosts; \
	fi
	sudo docker-compose -f srcs/docker-compose.yml build
	sudo docker-compose -f srcs/docker-compose.yml up -d


#Stop and remove all the container and the images
clean:
	sudo docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@if [ -d $(FILES_PATH) ]; then \
			sudo rm -rf $(FILES_PATH); \
	fi;
	docker system prune -f

re: fclean all

#Create and start containers
up:
	sudo docker-compose -f srcs/docker-compose.yml up -d

#list the containers
ps:
	sudo docker-compose -f srcs/docker-compose.yml ps

#Stop and remove containers (Images are not deleted)
down:
	sudo docker-compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up ps down