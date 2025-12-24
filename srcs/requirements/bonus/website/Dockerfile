FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /var/www/html

RUN rm -f /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
