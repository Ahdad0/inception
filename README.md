*This project has been created as part of the 42 curriculum by abahaded.*

# Inception

## Description
A Docker infrastructure project that sets up Nginx, WordPress, and MariaDB in separate containers, communicating via a private network.

## Instructions

### Prerequisites
- Docker & Docker Compose installed
- Linux system

## Resources
* [Docker Docs](https://docs.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Nginx](https://nginx.org/)
* [WordPress](https://wordpress.org/)
* [MariaDB](https://mariadb.com/)
## AI Usage
AI was used for documentation, debugging tips, and configuration examples. All content was reviewed and tested.

### Quick Start
```bash
cd inception
make all
make logs
```

Access:
* Add to hosts: 127.0.0.1 abdo.42.fr
* Visit: https://abdo.42.fr
* Admin: https://abdo.42.fr/wp-admin (user: wpuser)

commands:
```make build    # Build images
make up       # Start services
make stop     # Stop services
make down     # Stop & remove
make clean    # Remove everything
make logs     # View logs
make re       # Clean rebuild
make start    # Start stopped services
```

## Project Overview
Docker vs Virtual Machines

Docker is lightweight and fast (seconds to start), VMs are heavy (minutes to start). We use Docker for efficiency.

Secrets vs Environment Variables

* **Secrets** (passwords): Stored in secrets/ folder, hidden from logs
* **Environment variables** (config): Stored in .env, visible but non-sensitive

Docker Network vs Host Network

We use a custom inception network so services communicate privately and securely (not exposed to host).

Docker Volumes vs Bind Mounts

We use bind mounts to /home/abdo/data/ so data is directly accessible on the host.