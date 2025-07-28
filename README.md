# Docker Infrastructure

A curated collection of Docker Compose configurations for common development services. Start any service instantly without dealing with configuration files.

## 🚀 Quick Start

```bash
# Start any service
make postgres
make redis
make flowise

# Start multiple services
make postgres redis kafka

# Stop a service
make stop-postgres

# View logs
make logs-postgres

# See all available services
make help
```

## 📦 Available Services

**Databases:** `postgres` `mysql` `mongo` `redis`  
**AI/ML:** `flowise` `open-webui`  
**Infrastructure:** `kafka` `opentelemetry` `portainer` `adguard-home`

Each service includes web interfaces and is pre-configured for immediate development use.

## 🎛️ Customization

Override defaults with environment variables:

```bash
# PostgreSQL with custom credentials and web UI port
POSTGRES_PASSWORD=mypass PGADMIN_PORT=8080 make postgres

# MySQL with custom root password and phpMyAdmin port
MYSQL_ROOT_PASSWORD=secret PHPMYADMIN_PORT=8080 make mysql

# Flowise on custom port with specific version
FLOWISE_PORT=8080 FLOWISE_VERSION=1.6.5 make flowise

# Open WebUI with authentication enabled
OPEN_WEBUI_AUTH=True OPEN_WEBUI_PORT=3000 make open-webui
```

## 🛠️ Management

```bash
make <service>         # Start service
make stop-<service>    # Stop service  
make logs-<service>    # View logs
make restart-<service> # Restart service
make clean            # Stop all services
make status           # Show running containers
```

## ➕ Adding Services

1. Create directory: `mkdir new-service`
2. Add `compose.yml` and `README.md`
3. Run: `make new-service`

The Makefile automatically discovers new services.

## 📁 Structure

```
docker-infra/
├── Makefile              # Service automation
├── service-name/         # Each service in own directory
│   ├── compose.yml       # Docker Compose config
│   └── README.md         # Service documentation
└── ...
```

---

**Note:** This is designed for development environments. For production, review security settings and resource limits in each service's documentation.