# Kafka

Distributed streaming platform for real-time data processing with Apache Kafka, Zookeeper, and web-based management interface.

## What it does

- **Distributed Streaming** - High-throughput, low-latency platform for real-time data feeds
- **Publish-Subscribe Messaging** - Reliable message queuing with topic-based organization
- **Event Sourcing** - Store and replay event sequences for event-driven applications
- **Stream Processing** - Real-time data processing with consumer groups and load balancing
- **Web Management UI** - Browser-based interface for managing topics and cluster health
- **Integration Ready** - Compatible with numerous data integration tools and frameworks

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access Kafka UI at `http://localhost:8080`
3. Connect applications to Kafka broker at `localhost:9092`
4. Create topics and manage messages through the web interface

**Note:** Single-node setup optimized for development environments with replication factor 1.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `KAFKA_PORT` | `9092` | External port for Kafka broker client connections |
| `KAFKA_UI_PORT` | `8080` | Port for accessing the Kafka UI web interface |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Custom port configuration
KAFKA_PORT=9093 KAFKA_UI_PORT=8081 docker compose up -d

# Development with custom external port
KAFKA_PORT=29092 docker compose up -d
```

**Note:** Includes Zookeeper coordination service for cluster management.

## Limitations

- Single-node configuration (no fault tolerance or high availability)
- Replication factor of 1 (no data redundancy)
- Not suitable for production without additional configuration
- No authentication or security features enabled

## Links & Resources

- **Official Website:** <https://kafka.apache.org>
- **Official GitHub:** <https://github.com/apache/kafka>
- **Documentation:** <https://kafka.apache.org/documentation/>
- **Docker Hub:** <https://hub.docker.com/r/confluentinc/cp-kafka>
