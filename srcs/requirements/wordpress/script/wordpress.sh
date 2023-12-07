#!/bin/sh

#script per installare wordpress

#controllo se il file wp-config.php è già presente
#in caso contrario scarico wordpress e lo scompatto

if [ ! -f ./wp-config.php ]

then
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#caricamento delle variabili utilizzare per l'autenticazione
	#al database di mariadb
	sed -i "s/username_here/$WP_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WP_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$WP_DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

fi

exec "$@"
