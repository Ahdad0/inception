FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/redis && \
    chmod 755 /var/run/redis && \
    chown redis:redis /var/run/redis

COPY ./script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["/usr/local/bin/script.sh"]