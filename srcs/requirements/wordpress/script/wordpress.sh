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

#configuro l'interfaccia di wordpress e il database
cd /var/www/html

/usr/local/bin/wp-cli.phar core config	--dbhost=$MYSQL_HOSTNAME \
				--dbname=$WP_DB_NAME \
				--dbuser=$WP_DB_USER \
				--dbpass=$WP_DB_PASSWORD \
				--path='/var/www/html' \
				--allow-root

/usr/local/bin/wp-cli.phar core install --title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_EMAIL \
				--url=$WP_URL \
				--skip-email \
				--path='/var/www/html' \
				--allow-root

/usr/local/bin/wp-cli.phar user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --path='/var/www/html' --allow-root
cd -

fi

exec "$@"
