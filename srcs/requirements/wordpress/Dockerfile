FROM	debian:bullseye

RUN     apt update -y && apt install -y wget \
        php php-fpm php-mysql mariadb-client php-redis

RUN     wget https://wordpress.org/wordpress-6.8.1.tar.gz -P /var/www && \
        cd /var/www && tar -xzf wordpress-6.8.1.tar.gz && \
        rm wordpress-6.8.1.tar.gz && chmod -R 755 /var/www/wordpress

COPY 	www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod 755 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY    setup.sh /tmp/setup.sh

RUN     chmod u+x /tmp/setup.sh

CMD [ "/tmp/setup.sh" ]