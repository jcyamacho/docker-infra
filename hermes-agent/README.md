# Hermes Agent

Self-improving AI agent by Nous Research with persistent memory, tools, and an OpenAI-compatible API.

## What it does

- **Autonomous Agent** - Runs tasks with 60+ built-in tools such as terminal, browser, web search, and vision
- **Persistent Memory** - Keeps memories, skills, and sessions across runs
- **OpenAI-Compatible API** - Use the agent from any OpenAI client or SDK
- **Web Dashboard** - Manage the agent and its sessions from the browser
- **Messaging Gateway** - Chat with the agent from Telegram, Discord, Slack, WhatsApp, and more
- **Any Model Provider** - OpenRouter, OpenAI, Anthropic, Nous Portal, or a local Ollama

## Quick Start

1. Configure a model provider: `docker compose run --rm hermes-agent setup`
2. Run with Docker Compose: `docker compose up -d`
3. Access the dashboard at `http://localhost:9119` (user `admin`, password `hermes`)
4. Call the API at `http://localhost:8642/v1` with the bearer token `hermes-local-dev-key`

**Note:** To use a local Ollama, choose a custom OpenAI-compatible endpoint during setup with `http://host.docker.internal:11434/v1`.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `HERMES_VERSION` | `latest` | Hermes Agent Docker image tag |
| `HERMES_API_PORT` | `8642` | Host port for the OpenAI-compatible API |
| `HERMES_DASHBOARD_PORT` | `9119` | Host port for the web dashboard |
| `HERMES_API_KEY` | `hermes-local-dev-key` | API bearer token (sets `API_SERVER_KEY`, 16+ characters) |
| `HERMES_DASHBOARD_USER` | `admin` | Dashboard basic auth username |
| `HERMES_DASHBOARD_PASSWORD` | `hermes` | Dashboard basic auth password |

Provider API keys and the model are stored in `.env` and `config.yaml` inside the `hermes_data` volume, written by `setup`.

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Change the model provider or API keys (stop the service first)
docker compose down
docker compose run --rm hermes-agent setup

# Chat from the terminal inside the running container
docker compose exec -u hermes hermes-agent /opt/hermes/.venv/bin/hermes

# Call the OpenAI-compatible API
curl http://localhost:8642/v1/chat/completions \
  -H "Authorization: Bearer hermes-local-dev-key" \
  -H "Content-Type: application/json" \
  -d '{"model": "hermes-agent", "messages": [{"role": "user", "content": "Hello"}]}'

# Custom ports, credentials, and version
HERMES_DASHBOARD_PORT=9000 HERMES_DASHBOARD_PASSWORD=secret HERMES_VERSION=0.23.1 docker compose up -d
```

**Note:** Ports are published on `127.0.0.1` only, because the API and dashboard give access to an agent that runs shell commands.

## Limitations

- Requires an LLM provider API key or a local model server (not included)
- The agent runs shell commands inside this container; the Docker sandbox backend is not configured
- Messaging platforms need their own bot tokens, configured through `setup`
- Only one container may use the data volume at a time, so stop the service before running `setup`
- Dashboard logins reset when the container restarts

## Links & Resources

- **Official Website:** <https://hermes-agent.nousresearch.com>
- **Official GitHub:** <https://github.com/NousResearch/hermes-agent>
- **Documentation:** <https://hermes-agent.nousresearch.com/docs>
- **Docker Hub:** <https://hub.docker.com/r/nousresearch/hermes-agent>
