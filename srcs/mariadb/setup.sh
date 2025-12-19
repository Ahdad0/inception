#!/bin/sh
DATA_DIR=/var/lib/mysql

if [ ! -d "$DATA_DIR" ] || [ -z "$(ls -A "$DATA_DIR" 2>/dev/null)" ]; then
    mysql_install_db --user=mysql --datadir=$DATA_DIR

    mysqld_safe --datadir=$DATA_DIR --skip-networking --skip-grant-tables &
    until mysqladmin ping >/dev/null 2>&1; do echo -n "."; sleep 1; done

    mysql -u root <<EOF
        CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
        CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
        GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
        FLUSH PRIVILEGES;
EOF

    mysqladmin -u root shutdown
    echo "Database initialization complete."
else
    echo "Database already initialized"
fi

echo "Starting MariaDB server..."
exec mysqld_safe --datadir=$DATA_DIR