FROM debian

#installo nginx e i certificati ssl
RUN apt-get -y update && apt-get install -y nginx && apt-get install openssl -y

#creo la cartella per nginx
RUN mkdir -p /run/nginx

#creo la cartella per i certificati ssl
RUN mkdir -p /etc/nginx/ssl

#genero i certificati ssl
RUN openssl req -newkey rsa:2048 \
	-x509 \
	-sha256 \
	-days 365 \
	-nodes \
	-keyout /etc/nginx/ssl/amargiac.42.fr.key \
	-out /etc/nginx/ssl/amargiac.42.fr.crt \
	-subj "/C=IT/ST=Italy/L=Roma/O=42Roma/OU=$USER/CN=$USER"

COPY html/index.html /html/index.html

#copio il file di configurazione di nginx nella cartella di configurazione
COPY nginx.conf /etc/nginx/conf.d

EXPOSE 443

#lancio nginx
CMD ["nginx", "-g", "daemon off;"]
