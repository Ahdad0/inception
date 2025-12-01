#!/bin/sh

DATA_DIR=/var/lib/mysql

if [ ! -d $DATA_DIR ] || [ -z $(ls -A $DATA_DIR) ]; then

    mysql_install_db --user=mysql --datadir=$DATA_DIR

    mysqld_safe --datadir=$DATA_DIR &

    until mysqladmin ping >/dev/null 2>&1; do
        echo -n "."; sleep 1
    done

    mysql -u root <<EOF
        CREATE DATABASE IF NOT EXISTS W;
        CREATE USER IF NOT EXISTS 'abdo'@'%' IDENTIFIED BY 'aaaa';
        GRANT ALL PRIVILEGES ON W.* TO 'abdo'@'%';
        FLUSH PRIVILEGES;
EOF

    mysqladmin -u root shutdown

    echo "Database initialion complete."
else
    echo "Database already initialized"
fi

echo "Starting Maridb server..."
exec mysqld_safe --datadir=$DATA_DIR