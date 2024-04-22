FROM alpine:3.18

#installation of mariadb
RUN apk add --no-cache mariadb mariadb-server

#configuration file mariadb from version 3.9 alpine onwards 
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf	
#Expose the port for mariaDB

EXPOSE 3306

CMD ["etc/mysql/my.cnf"]

