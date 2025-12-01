FROM alpine:latest

RUN apk add --no-cache \
    mariadb \
    mariadb-client

RUN sed -i "s/skip-networking/#skip-networking/" /etc/my.cnf.d/mariadb-server.cnf

RUN sed -i "s/#bind-address=0.0.0.0/bind-address = 0.0.0.0/" /etc/my.cnf.d/mariadb-server.cnf

COPY setup.sh /tmp/setup.sh

RUN chmod u+x /tmp/setup.sh

CMD [ "/tmp/setup.sh" ]