# Flowise

Flowise is an open-source low-code tool for building customized LLM orchestration flows and AI agents using a visual drag-and-drop interface.

## What it does

- **Visual workflow builder** - Create AI applications using an intuitive drag-and-drop interface
- **LLM orchestration** - Connect and chain multiple AI models from different providers
- **AI agents** - Build autonomous agents that can perform complex multi-step tasks
- **Chatflows** - Create conversational AI applications and chatbots
- **Custom tools integration** - Connect external APIs and services to your workflows
- **Memory management** - Implement conversation memory and context retention
- **Document processing** - Upload and process documents for AI-powered Q&A
- **Multi-modal support** - Handle text, images, and other data types in workflows
- **API endpoints** - Deploy your flows as REST APIs for integration
- **Template library** - Access pre-built templates for common use cases

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access web interface at `http://localhost:3000`
3. Start building your AI workflows using the visual editor
4. Configure your LLM providers (OpenAI, Azure, etc.) in the settings
5. Create your first chatflow or agent using the template library

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `FLOWISE_PORT` | `3000` | Port for the web interface |

### Usage Examples

```bash
# Standard deployment
docker compose up -d

# Run on custom port
FLOWISE_PORT=8080 docker compose up -d

```

**Note:** All workflows, configurations, and data are stored in the `flowise-db` volume for persistence across container restarts.

## Limitations

- Requires internet access for LLM provider connections
- Performance depends on chosen LLM provider response times
- Some advanced features may require specific LLM provider capabilities
- File upload size limits depend on the underlying LLM provider constraints

## Links & Resources

- **Official Website:** <https://flowiseai.com>
- **Official GitHub:** <https://github.com/FlowiseAI/Flowise>
- **Documentation:** <https://docs.flowiseai.com>
- **Docker Hub:** <https://hub.docker.com/r/flowiseai/flowise>
