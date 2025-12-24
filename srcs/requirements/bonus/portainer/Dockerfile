FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    tar \
    ca-certificates

COPY script.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

CMD ["/tmp/setup.sh"]