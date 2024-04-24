FROM alpine:3.18

#installation of mariadb
RUN apk update && apk add --no-cache mariadb mariadb-client

#configuration file mariadb from version 3.9 alpine onwards 
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf	
RUN chmod 644 /etc/my.cnf.d/mariadb-server.cnf

COPY script/mariadb.sh /tmp/mariadb.sh
RUN chmod +x /tmp/mariadb.sh

#Expose the port for mariaDB
EXPOSE 3306

CMD ["sh", "/tmp/mariadb.sh"]

