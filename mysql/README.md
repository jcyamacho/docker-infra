# MySQL

MySQL database server with phpMyAdmin web interface for database administration and development.

## What it does

- **Database Server** - Robust MySQL database server for applications and development
- **Web Administration** - phpMyAdmin interface for browser-based database management
- **User Management** - Configurable root and user credentials for database access
- **Data Persistence** - Automatic data persistence through Docker volumes
- **Network Isolation** - Dedicated Docker network for secure service communication
- **Development Ready** - Pre-configured for immediate development use

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access phpMyAdmin at `http://localhost:5000`
3. Connect to MySQL server at `localhost:3306`
4. Login with default credentials (root/root or user/password)

**Note:** Default configuration is optimized for development environments.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `MYSQL_ROOT_PASSWORD` | `root` | Password for the MySQL root user |
| `MYSQL_USER` | `user` | Name for additional MySQL user account |
| `MYSQL_PASSWORD` | `password` | Password for the additional MySQL user |
| `PHPMYADMIN_PORT` | `5000` | Port for phpMyAdmin web interface |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Custom root password and user credentials
MYSQL_ROOT_PASSWORD=secretroot MYSQL_USER=myapp MYSQL_PASSWORD=myapppass docker compose up -d

# Custom phpMyAdmin port
PHPMYADMIN_PORT=8080 docker compose up -d
```

**Note:** Change default passwords for production environments.

## Limitations

- Single instance setup (no high availability)
- Default credentials are insecure for production use
- phpMyAdmin image optimized for ARM64 (Mac M-chip) architecture

## Links & Resources

- **Official Website:** <https://www.mysql.com>
- **Official GitHub:** <https://github.com/mysql/mysql-server>
- **Documentation:** <https://dev.mysql.com/doc/>
- **Docker Hub:** <https://hub.docker.com/_/mysql>
