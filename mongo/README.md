# MongoDB

Document-oriented NoSQL database with Mongo Express web interface for database management and development.

## What it does

- **Document Storage** - Store and retrieve JSON-like documents with flexible schemas
- **High Performance** - Fast queries with automatic indexing and aggregation framework
- **Web Administration** - Mongo Express provides browser-based database management
- **Flexible Schema** - Dynamic data structures that evolve with application needs
- **Rich Queries** - Powerful querying with full-text search and geospatial capabilities
- **ACID Transactions** - Multi-document transactions for data consistency

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access Mongo Express at `http://localhost:8081`
3. Connect applications to `mongodb://localhost:27017`
4. Login to Mongo Express with default credentials (admin / pass)

**Note:** Default configuration runs without authentication, suitable for development environments.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `MONGO_EXPRESS_PORT` | `8081` | Port for Mongo Express web interface |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Custom Mongo Express port
MONGO_EXPRESS_PORT=8080 docker compose up -d

# Connect with mongo shell
mongo mongodb://localhost:27017/your-database-name
```

**Note:** Database files are persisted in Docker volumes across container restarts.

## Limitations

- No authentication configured (development only)
- Single instance setup (no replica set for high availability)
- Requires sufficient RAM for optimal performance with large datasets

## Links & Resources

- **Official Website:** <https://www.mongodb.com>
- **Official GitHub:** <https://github.com/mongodb/mongo>
- **Documentation:** <https://docs.mongodb.com>
- **Docker Hub:** <https://hub.docker.com/_/mongo>
