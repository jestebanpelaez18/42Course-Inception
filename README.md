
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




<img width="481" alt="Screenshot 2024-05-24 at 20 15 07" src="https://github.com/jestebanpelaez18/42Course-Inception/assets/101594895/9acb28f0-f0ab-4a02-ac9a-6c8b6fb687eb">



## Installation
## Concepts
### What is a container ?
Containers function as encapsulated environments that include all the necessary components for an application to run. By packaging all dependencies within the container, it ensures consistency and simplifies deployment across various computing environments. This eliminates concerns about installation and updates, as the container includes everything required.

Docker manages these containers, streamlining the process of building, deploying, and running applications

### Docker images 

Certainly! Here's a more professional version:

Images serve as blueprints for containers and include the following components:

- Runtime environment
- Application code
- Dependencies
- Additional configurations
- Commands

When an image is executed, a container is created, effectively running the application. These containers are self-contained and isolated, ensuring that the application runs consistently regardless of the host system's configuration. This isolation allows the image to be shared with multiple users, eliminating the need for them to install anything on their machines, as Docker manages all necessary aspects.

### Docker Commands

https://localhost:443
