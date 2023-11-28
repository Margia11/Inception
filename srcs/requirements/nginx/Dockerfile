FROM alpine

RUN apk update && apk upgrade

RUN apk --no-cache add nginx openssl

RUN mkdir -p /run/nginx

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:2048 \
	-x509 \
	-sha256 \
	-days 365 \
	-nodes \
	-keyout /etc/nginx/ssl/inception.key \
	-out /etc/nginx/ssl/inception.pem \
	-subj "/C=IT/ST=Italy/L=Roma/O=42Roma/OU=$USER/CN=$USER"
#genera una nuova chiave privata e la salva nel file specificato
#certificato autofirmato
#algoritmo per la firma
#validità del certificato
#non cripta la chiave privata
#percorso e nome del file della chiave privata
#specifica i dettagli del certificato

COPY nginx.conf /etc/nginx/http.d/nginx.conf


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
