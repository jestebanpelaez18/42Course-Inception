FROM alpine:3.18

#installation of mariadb
RUN apk add --no-cache mariadb mariadb-server

#configuration file mariadb
COPY conf/mariadb.cnf /etc/mysql/my.cnf

#Expose the port for mariaDB

EXPOSE 3306

CMD ["etc/mysql/my.cnf"]

