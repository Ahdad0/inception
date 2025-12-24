#!/bin/bash

adduser --disabled-password --gecos "" $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.pem \
    -out /etc/ssl/private/vsftpd.pem \
    -subj "/C=MO/L=BG/O=1337/OU=student/CN=abahaded.42.fr"

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

mkdir -p /var/run/vsftpd/empty

mv /tmp/vsftpd.conf /etc/vsftpd.conf

echo "Starting vsftpd..."
/usr/sbin/vsftpd /etc/vsftpd.conf