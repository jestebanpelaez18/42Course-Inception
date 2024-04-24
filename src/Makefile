#Start and build docker compose service, then start the containers
all:
	docker-compose -f src/docker-compose.yml build
	docker-compose -f src/docker-compose.yml up -d

#Stop and remove all the container and the images
clean:
	docker-compose -f src/docker-compose.yml down --rmi all -v

fclean: clean

re: fclean all

#Create and start containers
up:
	docker-compose -f src/docker-compose.yml up -d

#list the containers
ps:
	docker-compose -f src/docker-compose.yml ps

#Stop and remove containers (Images are not deleted)
down:
	docker-compose -f src/docker-compose.yml down

.PHONY: all clean fclean re up ps down