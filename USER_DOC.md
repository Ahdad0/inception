# User Documentation

## Services Provided
- **Nginx**: HTTPS reverse proxy and web server (port 443)
- **WordPress**: PHP-FPM app server (internal only)
- **MariaDB**: Database server (internal only)
- **Volumes**: `/home/abahaded/data/db` (DB) and `/home/abahaded/data/wp` (WordPress files)
- **Network**: `inception` (containers communicate by service name)

## Start and Stop

### Using Makefile (recommended)
```bash
make all        # build and start
make logs       # follow logs
make stop       # stop containers (data is kept)
make down       # stop + remove containers (data kept)
make clean      # remove containers, images, volumes (data lost)
make re         # clean rebuild
make start      # start stopped containers
```

## Accessing the Website and Admin

1. Map the domain locally (once):
```bash
echo "127.0.0.1 abahaded.42.fr" | sudo tee -a /etc/hosts
```
2. Open the site:
   - Website: https://abahaded.42.fr  
   - Admin panel: https://abahaded.42.fr/wp-admin  
   - Admin credentials: from `.env` → `ADMIN_USER` / `ADMIN_PASSWORD`

> Note: You may see a certificate warning (self-signed cert). Choose “Proceed” or “Advanced → Continue”.

## Credentials Location
- **WordPress admin**
  - User: `.env` → `ADMIN_USER`
  - Password: `.env` → `ADMIN_PASSWORD`
- **WordPress secondary user (author)**
  - User: `.env` → `USER`
  - Email: `.env` → `USER_EMAIL`
  - Password: `.env` → `USER_PASSWORD`
- **Database (MariaDB)**
  - Host: `ma` (service name on Docker network)
  - Database: `.env` → `MYSQL_DATABASE`
  - Username: `.env` → `MYSQL_USER`
  - Password: `.env` → `MYSQL_PASSWORD`
  - Root password: `.env` → `MYSQL_ROOT_PASSWORD`

## Check Services Are Running
- Show containers:
```bash
docker compose -f srcs/docker-compose.yml ps
docker ps
```
- Nginx reachable:
```bash
curl -kI https://abahaded.42.fr
```
- WordPress responding:
```bash
curl -k https://abahaded.42.fr | head -n 5
```
- Database connectivity from WordPress container:
```bash
docker exec -it wo mariadb -h ma -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1;"
```
- WordPress installed:
```bash
docker exec wo wp core is-installed --allow-root --path=/var/www/wordpress && echo "WP OK"
```