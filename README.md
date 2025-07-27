# Docker Infrastructure

A configuration library of predefined Docker Compose setups for commonly used services and tools. Deploy any service with a single command instead of recreating configurations from scratch.

## 🚀 Quick Start

Launch any service:

```bash
make <service-name>
```

Examples:

```bash
make postgres    # Start PostgreSQL database
make redis       # Start Redis cache
make flowise     # Start Flowise AI workflow builder
make adguard-home # Start AdGuard Home DNS blocker

# Start multiple services
make postgres redis kafka
```

## 📦 Available Services

### Databases

- **postgres** - PostgreSQL with pgAdmin
- **mysql** - MySQL with phpMyAdmin
- **mongo** - MongoDB with Mongo Express
- **redis** - Redis with Redis Commander

### AI/ML Platforms

- **flowise** - Low-code AI workflow builder
- **open-webui** - ChatGPT-style web interface for LLMs

### Infrastructure & Monitoring

- **kafka** - Distributed streaming platform with UI
- **opentelemetry** - Complete observability stack
- **portainer** - Docker container management
- **adguard-home** - Network-wide DNS filtering

## 🛠️ Managing Services

```bash
# Stop a service
make stop-postgres

# View logs
make logs-postgres

# Restart a service
make restart-postgres

# Stop all services
make clean

# Check running containers
make status

# Get help and see all available services
make help
```

### Environment Customization

```bash
# Customize with environment variables
FLOWISE_PORT=8080 make flowise
POSTGRES_PASSWORD=mypassword make postgres
PGADMIN_PORT=8080 make postgres
```

## 📁 Project Structure

```md
docker-infra/
├── Makefile              # Automation and service discovery
├── <service-name>/       # Each service in its own directory
│   ├── compose.yml       # Docker Compose configuration
│   └── README.md         # Service-specific documentation
└── ...
```

Each service is self-contained with its own configuration and documentation.

## ➕ Adding New Services

1. Create directory: `mkdir new-service`
2. Add `compose.yml` and `README.md`
3. Test: `make new-service`

The Makefile automatically detects new services - no configuration needed.
