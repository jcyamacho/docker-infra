# Open WebUI

Self-hosted ChatGPT-style web interface for LLMs with advanced AI features.

## What it does

- **Chat Interface** - Modern web UI for AI conversations
- **Multi-Backend Support** - Ollama, OpenAI API, and compatible services
- **Document Intelligence** - RAG with file uploads and web search
- **Content Generation** - Image creation and code execution
- **Multi-User Platform** - Authentication, workspaces, and role management
- **Extensible** - Plugin system and offline operation

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access web interface at `http://localhost:8080`
3. Configure LLM backend (requires Ollama or API connection)
4. Create admin account (first user becomes admin)

**Note:** Requires separate LLM backend service. Install [Ollama](https://ollama.com) locally or configure API access.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `OPEN_WEBUI_VERSION` | `main` | Docker image tag |
| `OPEN_WEBUI_PORT` | `8080` | Web interface port |
| `OPEN_WEBUI_AUTH` | `False` | Enable authentication (sets `WEBUI_AUTH`) |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Enable authentication
OPEN_WEBUI_AUTH=True docker compose up -d

# Custom port and version
OPEN_WEBUI_VERSION=v0.13.3 OPEN_WEBUI_PORT=3000 docker compose up -d
```

**Note:** Authentication disabled = all users have admin privileges. Choose before the first start: authentication cannot be disabled once user accounts exist.

## Limitations

- Requires external LLM backend (not included)
- Large model downloads (several GB)
- Advanced features need additional configuration

## Links & Resources

- **Official Website:** <https://openwebui.com>
- **Official GitHub:** <https://github.com/open-webui/open-webui>
- **Documentation:** <https://docs.openwebui.com>
- **Container Image:** <https://github.com/open-webui/open-webui/pkgs/container/open-webui>
