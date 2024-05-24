
# Inception 

Welcome to Inception, a project focused on exploring the world of system administration using Docker. This project involves virtualizing and managing multiple Docker images within a personal virtual machine. It aims to deepen the understanding of containerization and enhance skills in managing and orchestrating systems in practical, real-world scenarios.


## Content

- [Key Features](#keyfeatures)
- [Installation](#installation)
- [Concepts](#keyconcepts)
## Key Features

- This project consists in set up a small infrastructure composed of different services under specific rules. Have to use Docker Compose.
- The containers must be built either from the penultimate stable version of Alpine or Debian. For this case we use Alpine.
- We have to write the Dockerfile for each service, It means we have to build by ourself the Docker images of the project. It is then for- bidden to pull ready-made Docker images, as well as using services such as DockerHub. (Alpine/Debian being excluded from this rule).

Then we have to set up: 

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains WordPress database.
- A second volume that contains WordPress website files.
- A docker-network that establishes the connection between those three containers.

An example diagram of the expected result:





![Diagram](https://imgur.com/LlPSjVI)


## Installation
## Concepts

### What is a container ?
Containers is like a box that contains everything our application need to run, everything that our application needs
is ¡nside there. These makes everything simple, because we can run it in any computer, we dont need to worry about instalation, updates ... 

Docker will handle those containers.

### Docker images 

They are like blueprints for Containers, and it contents the next things:
-Runtime Enviroment
-Application code
-Any dependencies
-Extran config
-Commands

So basically when we run a image, we are creating a container, it means we are running our application. The containers are isolated, it already have everything for run the application no matter what version we have in our computer, it works independet. Because of that we can share the image with many users, and they dont need to install anything in his computer, everything is done by docker.

### Docker Commands

https://localhost:443