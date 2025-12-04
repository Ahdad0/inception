#!/bin/sh

DIR=/var/www/html

echo "Waiting for MariaDB to be ready..."

until mariadb -h maria -u abdo -paaaa -e "SELECT 1;" >/dev/null 2>&1; do
    echo -n "."; sleep 2
done

echo "MariaDB is ready."

if [ ! -f "$DIR/wp-config.php" ]; then
    echo "WordPress not found. Installing..."

    mkdir -p $DIR
    cd $DIR

    curl -O https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz wordpress

    mv wp-config-sample.php wp-config.php

    sed -i "s/database_name_here/W/g" wp-config.php
    sed -i "s/username_here/abdo/g" wp-config.php
    sed -i "s/password_here/aaaa/g" wp-config.php
    sed -i "s/localhost/ma/g" wp-config.php

    SALTS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
    sed -i '/AUTH_KEY/d' wp-config.php
    sed -i '/SECURE_AUTH_KEY/d' wp-config.php
    sed -i '/LOGGED_IN_KEY/d' wp-config.php
    sed -i '/NONCE_KEY/d' wp-config.php
    sed -i '/AUTH_SALT/d' wp-config.php
    sed -i '/SECURE_AUTH_SALT/d' wp-config.php
    sed -i '/LOGGED_IN_SALT/d' wp-config.php
    sed -i '/NONCE_SALT/d' wp-config.php
    echo "$SALTS" >> wp-config.php
    
    echo "WordPress configured."
else
    echo "WordPress already configured."
fi

echo "Starting PHP-FPM..."
exec php-fpm83 -F