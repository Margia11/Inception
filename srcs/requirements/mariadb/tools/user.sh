#!/bin/bash

# start mariadb service
service mariadb start

	mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
	sleep .1
	mariadb -uroot -e "CREATE USER IF NOT EXISTS '$WP_DB_USER'@'localhost' IDENTIFIED BY '$WP_DB_PASSWORD';"
	sleep .1
	mariadb -uroot -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';"
	sleep .1
	mariadb -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
	sleep .1
	mariadb -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
	sleep .1

mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld_safe

