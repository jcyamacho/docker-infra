# PostgreSQL

PostgreSQL database server with pgAdmin web interface for database administration and development.

## What it does

- **SQL Database Server** - Robust PostgreSQL database for applications and development
- **Web Administration** - pgAdmin interface for database management and queries
- **Data Persistence** - Automatic data persistence through Docker volumes
- **Health Monitoring** - Built-in health checks for database availability
- **Network Isolation** - Dedicated Docker network for secure service communication
- **Development Ready** - Pre-configured for immediate development use

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access pgAdmin at `http://localhost:5000`
3. Connect to database at `localhost:5432`
4. pgAdmin opens without a login; register a server with host `postgres`, user `postgres`, password `postgres`

**Note:** Default configuration is optimized for development environments.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `POSTGRES_VERSION` | `latest` | PostgreSQL Docker image tag |
| `POSTGRES_USER` | `postgres` | PostgreSQL database username |
| `POSTGRES_PASSWORD` | `postgres` | PostgreSQL database password |
| `PGADMIN_PORT` | `5000` | Port for pgAdmin web interface |
| `PGADMIN_DEFAULT_EMAIL` | `user@email.com` | Email of the pgAdmin account created on first start |
| `PGADMIN_DEFAULT_PASSWORD` | `password` | Password of the pgAdmin account created on first start |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Custom database credentials
POSTGRES_USER=myapp POSTGRES_PASSWORD=secret docker compose up -d

# Custom pgAdmin port and credentials
PGADMIN_PORT=8080 PGADMIN_DEFAULT_EMAIL=admin@example.com PGADMIN_DEFAULT_PASSWORD=admin123 docker compose up -d

# Specific PostgreSQL version
POSTGRES_VERSION=18-alpine docker compose up -d
```

**Note:** Change default passwords for production environments.

## Limitations

- Single-instance setup (no high availability)
- Default credentials are insecure for production
- No automated backup configuration included
- Images older than PostgreSQL 18 store data in `/var/lib/postgresql/data`; mount the volume there for those tags, or the data ends up in an anonymous volume

## Links & Resources

- **Official Website:** <https://www.postgresql.org>
- **Official GitHub:** <https://github.com/postgres/postgres>
- **Documentation:** <https://www.postgresql.org/docs/>
- **Docker Hub:** <https://hub.docker.com/_/postgres>
