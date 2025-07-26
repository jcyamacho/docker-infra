# OpenTelemetry

Complete observability stack with OpenTelemetry collector, Grafana, Tempo, Mimir, and Loki in a single Docker image.

## What it does

- **Telemetry Ingestion** - Collects metrics, traces, and logs via OTLP HTTP/GRPC protocols
- **Metrics Storage** - Long-term Prometheus-compatible metrics storage with Grafana Mimir
- **Distributed Tracing** - High-volume tracing backend with Grafana Tempo
- **Log Aggregation** - Centralized logging with Grafana Loki
- **Visualization Dashboard** - Pre-configured Grafana instance with integrated data sources
- **Development Ready** - Built-in examples and traffic generation for testing

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access Grafana at `http://localhost:3000`
3. Login with username `admin` and password `admin`
4. Send telemetry data to OTLP endpoints (ports 4317/4318)

**Note:** This is an all-in-one observability stack perfect for development and testing environments.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `GRAFANA_PORT` | `3000` | Port for Grafana web interface |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Custom Grafana port
GRAFANA_PORT=3001 docker compose up -d

# Send sample telemetry (requires application instrumentation)
curl -X POST http://localhost:4318/v1/traces \
  -H "Content-Type: application/json" \
  -d '{"resourceSpans": []}'
```

**Note:** Applications should be configured to send telemetry to `http://localhost:4317` (GRPC) or `http://localhost:4318` (HTTP).

## Limitations

- Single-node deployment (not suitable for high-availability production)
- Default credentials should be changed for non-development use

## Links & Resources

- **Official GitHub:** <https://github.com/grafana/docker-otel-lgtm>
- **Docker Hub:** <https://hub.docker.com/r/grafana/otel-lgtm>
- **OpenTelemetry Docs:** <https://opentelemetry.io/docs/>
- **Grafana Documentation:** <https://grafana.com/docs/>
