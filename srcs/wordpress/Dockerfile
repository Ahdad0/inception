FROM alpine:latest

RUN apk add --no-cache \
    php83-fpm \
    php83-mysqli \
    php83-json \
    php83-mbstring \
    curl \
    mariadb-client \
    sed

RUN sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/" /etc/php83/php-fpm.d/www.conf

COPY setup.sh /tmp/setup.sh

RUN chmod u+x /tmp/setup.sh

CMD [ "/tmp/setup.sh" ]