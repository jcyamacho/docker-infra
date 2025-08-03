# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Docker Infrastructure project that provides curated Docker Compose configurations for common development services. The architecture follows a modular approach where each service is self-contained in its own directory with standardized structure.

## Architecture

- **Service-Based Structure**: Each service (postgres, redis, kafka, etc.) lives in its own directory
- **Standardized Layout**: Every service contains `compose.yml` and `README.md`
- **Auto-Discovery**: The Makefile automatically discovers services by scanning for `compose.yml` files
- **Environment Variable Configuration**: All services support customization through environment variables
- **Health Checks**: Services include Docker health checks for reliability
- **Volume Persistence**: Data is persisted through named Docker volumes
- **Network Strategy**: Networks used for multi-service stacks (database + admin UI), avoided for single services

## Common Commands

### Service Management

```bash
# Start any service
make <service-name>          # e.g., make postgres, make redis

# Start multiple services
make postgres redis kafka

# Stop services
make stop-<service-name>     # e.g., make stop-postgres

# View logs
make logs-<service-name>     # e.g., make logs-postgres

# Restart services
make restart-<service-name>  # e.g., make restart-postgres

# Stop all services
make clean

# Show running containers
make status

# List available services
make help
```

### Service Customization with Environment Variables

```bash
# PostgreSQL with custom credentials
POSTGRES_PASSWORD=mypass PGADMIN_PORT=8080 make postgres

# MySQL with custom settings
MYSQL_ROOT_PASSWORD=secret PHPMYADMIN_PORT=8080 make mysql

# Flowise on custom port
FLOWISE_PORT=8080 FLOWISE_VERSION=1.6.5 make flowise
```

## Available Services

**Databases:** postgres, mysql, mongo, redis
**AI/ML:** flowise, open-webui
**Infrastructure:** kafka, opentelemetry, portainer, adguard-home

## Docker Compose Standards

### Image Strategy

- **Databases**: `${SERVICE_VERSION:-latest}` (postgres, redis, mysql, mongo)
- **UI Tools**: Always `:latest` (pgadmin, redis-commander, phpmyadmin)
- **Applications**: `${APP_VERSION:-latest}`

### Port Strategy

- **Standard ports**: Hardcode (5432, 3306, 6379, 27017)
- **UI/Admin ports**: `${TOOL_PORT:-default}`
- **App ports**: `${APP_PORT:-8080}`

### Network Strategy

- **Multi-service stacks**: Use dedicated networks (database + admin UI)
- **Single services**: Use default bridge network (no networks section)

### Essential Structure Requirements

- Use `compose.yml` (NOT `docker-compose.yml`)
- Use `docker compose` command (NOT `docker-compose`)
- Include health checks with service-specific commands
- Use `restart: unless-stopped`
- Include named volumes for data persistence
- Avoid `container_name` (let Compose generate)

## Service README Standards

Each service README must follow this exact structure:

```markdown
# Service Name
[Single line description]

## What it does
- **Core Feature** - Primary functionality
- **Secondary Feature** - Additional capability
[4-6 focused bullets total]

## Quick Start
1. Run with Docker Compose: `docker compose up -d`
2. Access [interface] at `http://localhost:[PORT]`
[4 steps maximum]

## Configuration
### Environment Variables
| Variable | Default | Description |
|----------|---------|-------------|
[Table format required]

### Usage Examples
\`\`\`bash
# Basic usage
docker compose up -d
# Custom examples
\`\`\`

## Limitations

- [Specific limitations]

## Links & Resources

- **Official Website:** [link]
- **Official GitHub:** [link]

```

## Adding New Services

1. Create directory: `mkdir new-service`
2. Add `compose.yml` following Docker Compose standards
3. Add `README.md` following service README standards
4. Run: `make new-service` (auto-discovered by Makefile)

## Development Notes

- Designed for development environments
- Default credentials are intentionally simple for development use
- All services configured for immediate use without additional setup
- Volume data persists across container restarts
- Research health checks and volume paths for each service from official documentation
