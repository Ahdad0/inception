FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php \
    php-mysqli \
    wget

COPY script.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

CMD ["/tmp/setup.sh"]