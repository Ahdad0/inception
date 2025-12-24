#!/bin/bash

mkdir -p /var/www/html

wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/index.php

echo "Starting Adminer on port 8080..."
php -S 0.0.0.0:8080 -t /var/www/html