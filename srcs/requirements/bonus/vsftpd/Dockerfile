FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd openssl

COPY vsftpd.conf /tmp/vsftpd.conf
COPY script.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

CMD ["/tmp/setup.sh"]