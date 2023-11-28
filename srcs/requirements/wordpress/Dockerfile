FROM alpine

#aggiorno e installo i pacchetti necessari
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
    php7-zlib php7-curl php7-mbstring php7-json php7-session

COPY ./html /tmp/html

#creazione cartella per il sito di wordpress
WORKDIR /var/www/html/
#installazione di wp-cli per la gestione di wordpress
ADD https://wordpress.org/latest.tar.gz /var/www/html
RUN tar -xzvf latest.tar.gz --strip-components=1 && rm latest.tar.gz

EXPOSE 9000

CMD ["php-fpm7", "-F"]
