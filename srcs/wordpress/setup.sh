#!/bin/sh

DIR=/var/www/wordpress

echo "Waiting for MariaDB to be ready..."

until mariadb -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD -e "SELECT 1;" >/dev/null 2>&1; do
    echo -n "."; sleep 2
done

echo "MariaDB is ready."

if [ ! -f "$DIR/wp-load.php" ]; then
    wp core download --allow-root --path=$DIR
fi

if [ ! -f "$DIR/wp-config.php" ]; then
    echo "WordPress not found. Installing..."

    wp config create   --allow-root \
                    --dbname=$MYSQL_DATABASE \
                    --dbuser=$MYSQL_USER \
                    --dbpass=$MYSQL_PASSWORD \
                    --dbhost=$MYSQL_HOST \
                    --path=$DIR


    wp core install --url=localhost \
                    --title="Inception" \
                    --admin_user=$ADMIN_USER \
                    --admin_password=$ADMIN_PASSWORD \
                    --admin_email=$ADMIN_EMAIL \
                    --allow-root \
                    --path=$DIR

    wp user create --allow-root \
                    'subscriber' 'subscriber@example.com' \
                    --user_pass='password456' \
                    --role='author' \
                    --path=$DIR
    
    echo "WordPress configured."
else
    echo "WordPress already configured."
fi

mkdir -p /run/php
echo "Starting PHP-FPM..."
exec php-fpm7.4 -F