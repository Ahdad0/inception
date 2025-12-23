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