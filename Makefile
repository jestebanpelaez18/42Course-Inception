#Start and build docker compose service, then start the containers
FILES_PATH = /Users/jpelaez-/data
all:
	@if [ ! -d "$(FILES_PATH)/mariadb" ]; then \
		mkdir -p $(FILES_PATH)/mariadb; \
		chmod -R 777 $(FILES_PATH)/mariadb; \
	fi
	@if [ ! -d "$(FILES_PATH)/wordpress" ]; then \
		mkdir -p $(FILES_PATH)/wordpress; \
		chmod -R 777 $(FILES_PATH)/wordpress; \
	fi
	docker-compose -f srcs/docker-compose.yml up -d


#Stop and remove all the container and the images
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean

re: fclean all

#Create and start containers
up:
	docker-compose -f srcs/docker-compose.yml up -d

#list the containers
ps:
	docker-compose -f srcs/docker-compose.yml ps

#Stop and remove containers (Images are not deleted)
down:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up ps down