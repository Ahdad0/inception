# Developer Documentation

## Prerequisites
- Linux environment
- Docker & Docker Compose plugin
- Make
- OpenSSL (if you need to regenerate the self-signed cert)
- Host entries: `127.0.0.1 abahaded.42.fr` in `/etc/hosts`

## Configuration
Create a `.env` file at the project root (or copy `.env.example` if available) and set:
  - `DOMAIN_NAME=abahaded.42.fr`
  - `MYSQL_DATABASE`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_ROOT_PASSWORD`
  - `ADMIN_USER`, `ADMIN_PASSWORD`, `ADMIN_EMAIL`, `USER`, `USER_EMAIL`, `USER_PASSWORD`
- Data directories (bind mounts on host):
  - DB: `/home/abahaded/data/db` ↔ MariaDB `/var/lib/mysql`
  - WordPress: `/home/abahaded/data/wp` ↔ WordPress `/var/www/wordpress`

## Build & Launch
```bash
make all        # build images and start stack
make logs       # tail all services
```

## Lifecycle & Management
```bash
make stop       # stop containers (data kept)
make start      # start existing containers
make down       # stop + remove containers (data kept)
make clean      # remove containers, images, volumes (data lost)
make re         # clean rebuild
docker compose -f srcs/docker-compose.yml ps   # show status
docker ps                                      # list running containers
```

## Container Names & Services
- `ma` → MariaDB
- `wo` → WordPress
- `nginx` → Nginx reverse proxy

## Useful Container Commands
```bash
docker exec -it wo sh                        # shell in WordPress
docker exec -it ma mariadb -u root -p        # shell into MariaDB client
docker logs -f nginx                         # follow Nginx logs
```

## Data Persistence
- **Bind mounts** (data on host filesystem):
  - `/home/abahaded/data/db` ↔ MariaDB data
  - `/home/abahaded/data/wp` ↔ WordPress files/uploads
- These survive `make stop`, `make down`, and `make re`.
- `make clean` removes volumes and thus all persisted data.