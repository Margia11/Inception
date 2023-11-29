FROM debian

RUN apt-get -y update && apt-get install -y nginx && apt-get install openssl -y

RUN mkdir -p /run/nginx

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:2048 \
	-x509 \
	-sha256 \
	-days 365 \
	-nodes \
	-keyout /etc/nginx/ssl/amargiac.42.fr.key \
	-out /etc/nginx/ssl/amargiac.42.fr.crt \
	-subj "/C=IT/ST=Italy/L=Roma/O=42Roma/OU=$USER/CN=$USER"

COPY html/index.html /html/index.html

COPY nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
