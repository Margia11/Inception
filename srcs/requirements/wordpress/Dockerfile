FROM debian

#installo php-fpm e le sue dipendenze
RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring

#installo wp-cli(interfaccia grafica di wordpress)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp-cli.phar

#copio il file di configurazione di php-fpm nella cartella di configurazione
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

#creo la cartella per php
RUN mkdir -p /run/php

COPY html/index.html /html/index.html

#copio lo script che installa e configura wordpress
COPY ./script/wordpress.sh /usr/local/bin/

#rendo lo script eseguibile
RUN chmod +x /usr/local/bin/wordpress.sh

#eseguo lo script
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

#imposto la cartella di lavoro

WORKDIR /var/www/html/

EXPOSE 9000

#lancio php-fpm in foreground che mi permette di eseguire script php
CMD ["/usr/sbin/php-fpm8.2", "-F"]
