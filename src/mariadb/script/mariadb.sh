#! /bin/bash

service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
