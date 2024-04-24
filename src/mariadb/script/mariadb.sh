#!/bin/sh

# This directories does not exist in the mariadb enviroment we have to create it, Because mariadb will be running with the socket 
# at location /run/mysqld/mysqld.sock 
mkdir -p /run/mysqld /var/lib/mysql /var/log/mysql/error.err

#Mysql need all the permission in this data directories, 
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /var/log/mysql/error.err

# init database
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

# his part of the script starts the MariaDB server in bootstrap mode, which allows it to execute SQL commands without requiring authentication.
mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
CREATE DATABASE $WORDPRESS_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$WORDPRESS_DB_USER'@'%' IDENTIFIED by '$WORDPRESS_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';
GRANT ALL PRIVILEGES ON *.* TO '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD' WITH GRANT OPTION;
GRANT SELECT ON mysql.* TO '$WORDPRESS_DB_USER'@'%';

FLUSH PRIVILEGES;
EOF

exec mysqld_safe --defaults-file=/etc/my.cnf.d/mariadb_server.cnf