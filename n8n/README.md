# n8n

n8n is a workflow automation platform that lets you connect services and automate processes using a visual, node-based editor.

## What it does

- **Visual Workflow Builder** - Create automation workflows using drag-and-drop interface
- **400+ Integrations** - Connect APIs, databases, and services with pre-built nodes
- **Custom Code Support** - Execute JavaScript and Python code within workflows
- **Webhook Triggers** - Start workflows from external HTTP requests and events
- **Scheduled Execution** - Run workflows on cron schedules and time intervals
- **Self-Hosted Control** - Full data ownership and custom deployment options

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access web interface at `http://localhost:5678`
3. Create your first workflow using the template library
4. Configure credentials for external services you want to connect

**Note:** All workflow data is persisted in the n8n_data volume.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `N8N_VERSION` | `latest` | n8n Docker image tag |
| `N8N_PORT` | `5678` | Port for the web interface |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Run on custom port
N8N_PORT=8080 docker compose up -d

# Specific version
N8N_VERSION=1.19.4 docker compose up -d
```

**Note:** Workflows and credentials are stored in the persistent volume.

## Limitations

- Single-instance setup (no clustering)
- External service credentials must be configured manually
- Some integrations may require additional setup or API keys
- Performance depends on workflow complexity and external service response times

## Links & Resources

- **Official Website:** <https://n8n.io>
- **Official GitHub:** <https://github.com/n8n-io/n8n>
- **Documentation:** <https://docs.n8n.io>
- **Docker Hub:** <https://hub.docker.com/r/n8nio/n8n>