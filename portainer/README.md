# Portainer

Docker container management platform with web-based GUI for managing Docker environments.

## What it does

- **Container Management** - Create, start, stop, and delete containers through web interface
- **Image Management** - Pull, push, and manage Docker images from registries
- **Volume & Network Control** - Manage Docker volumes and networks with visual tools
- **Multi-Environment Support** - Manage multiple Docker hosts and environments from single interface
- **User Access Control** - Role-based access control for team collaboration
- **Resource Monitoring** - Real-time monitoring of container resources and logs

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access web interface at `http://localhost:9000`
3. Create admin account on first visit
4. Select "Docker" environment to manage local Docker host

**Note:** Requires Docker socket access to manage containers.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `PORTAINER_PORT` | `9000` | Port for web interface |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Custom port
PORTAINER_PORT=8000 docker compose up -d
```

**Note:** First user to access the interface becomes the admin user.

## Limitations

- Requires Docker socket access (security consideration)
- Web interface only (no CLI included)
- Limited container orchestration features compared to Kubernetes

## Links & Resources

- **Official Website:** <https://www.portainer.io>
- **Official GitHub:** <https://github.com/portainer/portainer>
- **Documentation:** <https://docs.portainer.io>
- **Docker Hub:** <https://hub.docker.com/r/portainer/portainer-ce>
