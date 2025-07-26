# Docker Infrastructure

A configuration library of predefined Docker Compose setups for commonly used services and tools. Deploy any service with a single command instead of recreating configurations from scratch.

## 🚀 Usage

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

### Managing Services

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

# Customize with environment variables
FLOWISE_PORT=8080 make flowise
POSTGRES_PASSWORD=mypassword make postgres
```

## 📦 Available Services

**Databases:** postgres, mysql, mongo, redis
**AI/ML:** flowise, open-webui
**Security:** adguard-home, portainer
**Infrastructure:** kafka, opentelemetry

## 📁 Structure

```md
docker-infra/
├── Makefile              # Automation helper
├── <service-name>/       # Each service in its own directory
│   ├── compose.yml
│   └── README.md         # Service-specific docs
└── ...
```

Each service is self-contained with its own configuration and documentation.

## ➕ Adding Services

1. Create directory: `mkdir new-service`
2. Add `compose.yml` and `README.md`
3. Test: `make new-service`

The Makefile automatically detects new services.
