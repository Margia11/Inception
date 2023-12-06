FROM debian

RUN apt-get update && apt-get upgrade

RUN apt-get install mariadb-server -y

COPY ./tools/user.sh /user.sh

COPY ./tools/conf.cnf /etc/mysql/mariadb.conf.d/conf.cnf

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "/user.sh"]
