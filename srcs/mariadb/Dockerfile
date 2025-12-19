FROM	debian:bullseye

RUN		apt update -y && apt install mariadb-server -y

COPY	50-server.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY setup.sh /tmp/setup.sh

RUN chmod u+x /tmp/setup.sh

CMD [ "/tmp/setup.sh" ]