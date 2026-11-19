# Hermes Agent

Self-improving AI agent by Nous Research with persistent memory, tools, and an OpenAI-compatible API.

## What it does

- **Autonomous Agent** - Runs tasks with 60+ built-in tools such as terminal, browser, web search, vision, and computer use
- **Per-User Memory** - Keeps a separate Hindsight memory bank, with a knowledge graph, for each person who talks to the bot
- **OpenAI-Compatible API** - Use the agent from any OpenAI client or SDK
- **Bot Screen** - A virtual Linux desktop where the agent drives a browser, which you can watch and take over from Hermes Desktop
- **Web Dashboard** - Manage the agent and its sessions from the browser
- **Messaging Gateway** - Chat with the agent from Telegram, Discord, Slack, WhatsApp, and more
- **Any Model Provider** - OpenRouter, OpenAI, Anthropic, Nous Portal, or a local Ollama

## Quick Start

1. Configure a model provider: `docker compose run --rm hermes-agent setup`
2. Enable per-user Hindsight memory with the commands below
3. Run with Docker Compose: `OPENAI_API_KEY=sk-... docker compose up -d`
4. Access the dashboard at `http://localhost:9119` (user `admin`, password `hermes`) and the API at `http://localhost:8642/v1` with the bearer token `hermes-local-dev-key`

```bash
docker compose run --rm hermes-agent plugins install hindsight --yes-deps
docker compose run --rm hermes-agent config set memory.provider hindsight
# MEMORY.md and USER.md are shared by everyone who talks to the bot
docker compose run --rm hermes-agent config set memory.memory_enabled false
docker compose run --rm hermes-agent config set memory.user_profile_enabled false
```

**Note:** [hindsight.json](hindsight.json) points Hermes at the `hindsight` service and gives each sender their own bank (`hermes-{user}`). It also limits recall to about 1,024 tokens of relevant memories per turn; lower `recall_min_scores` if the agent misses things it should remember. Turns without a sender, such as the API, the dashboard, and the CLI, share the `hermes` bank. The Hindsight UI at `http://localhost:9999` lists the banks and their memories.

**Note:** The Bot Screen is off until you start it from the Screen pane in Hermes Desktop (connected to the dashboard port), from the Webapp at `http://localhost:9120`, or with `hermes computer-use screen start`. The Webapp serves the Desktop workspace in the browser and needs `webapp.enabled` (see the usage examples).

**Note:** To use a local Ollama, choose a custom OpenAI-compatible endpoint during setup with `http://host.docker.internal:11434/v1`.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `HERMES_VERSION` | `latest` | Hermes Agent Docker image tag, such as `v0.23.2` (`-desktop` is appended) |
| `HERMES_API_PORT` | `8642` | Host port for the OpenAI-compatible API |
| `HERMES_DASHBOARD_PORT` | `9119` | Host port for the web dashboard |
| `HERMES_WEBAPP_PORT` | `9120` | Host port for the Webapp (Hermes Desktop in the browser) |
| `HERMES_API_KEY` | `hermes-local-dev-key` | API bearer token (sets `API_SERVER_KEY`, 16+ characters) |
| `HERMES_DASHBOARD_USER` | `admin` | Dashboard basic auth username |
| `HERMES_DASHBOARD_PASSWORD` | `hermes` | Dashboard basic auth password |
| `HINDSIGHT_VERSION` | `latest` | Hindsight Docker image tag |
| `HINDSIGHT_UI_PORT` | `9999` | Host port for the Hindsight control plane UI |
| `OPENAI_API_KEY` | - | OpenAI API key for Hindsight (required), which extracts memories with `gpt-6-luna` |

Provider API keys and the model for Hermes itself are stored in `.env` and `config.yaml` inside the `hermes_data` volume, written by `setup`. The Hindsight plugin and the memory settings are stored there too, so step 2 runs only once.

### Usage Examples

```bash
# Basic usage
OPENAI_API_KEY=sk-... docker compose up -d

# Change the model provider or API keys (stop the service first)
docker compose down
docker compose run --rm hermes-agent setup

# Chat from the terminal inside the running container
docker compose exec -u hermes hermes-agent /opt/hermes/.venv/bin/hermes

# Enable the Webapp on port 9120 (stop the service first)
docker compose run --rm hermes-agent config set webapp.enabled true
docker compose run --rm hermes-agent config set webapp.host 0.0.0.0
docker compose run --rm hermes-agent config set webapp.port 9120

# Start the Bot Screen and check its computer-use driver
docker compose exec -u hermes hermes-agent /opt/hermes/.venv/bin/hermes computer-use screen start
docker compose exec -u hermes hermes-agent /opt/hermes/.venv/bin/hermes computer-use doctor

# Check that Hermes uses Hindsight as its memory provider
docker compose exec -u hermes hermes-agent /opt/hermes/.venv/bin/hermes memory status

# Watch Hindsight store and recall memories
docker compose logs -f hindsight

# Call the OpenAI-compatible API
curl http://localhost:8642/v1/chat/completions \
  -H "Authorization: Bearer hermes-local-dev-key" \
  -H "Content-Type: application/json" \
  -d '{"model": "hermes-agent", "messages": [{"role": "user", "content": "Hello"}]}'

# Custom ports, credentials, and version
HERMES_DASHBOARD_PORT=9000 HERMES_DASHBOARD_PASSWORD=secret HERMES_VERSION=v0.23.2 docker compose up -d
```

**Note:** Ports are published on `127.0.0.1` only, because the API, dashboard, and Webapp give access to an agent that runs shell commands. The Hindsight API is not published; Hermes reaches it at `http://hindsight:8888` on the stack network.

## Limitations

- Requires an LLM provider API key or a local model server (not included)
- Hindsight requires `OPENAI_API_KEY` to extract memories; its calls are billed to that key, while embeddings and reranking run locally
- Hindsight needs about 1.5-2 GB of RAM and takes up to a few minutes to load its local models on first start
- The Hindsight API and UI run without authentication, so any container on the stack network can read every bank
- Memory is separated per sender, but the agent's files and terminal are shared, so one person can ask the agent to read what another left in the container
- Installing the Hindsight plugin needs network access to GitHub and PyPI
- The agent runs shell commands inside this container; the Docker sandbox backend is not configured
- The Bot Screen is not a security boundary: the agent's terminal can reach its display and VNC socket
- An open Bot Screen with a browser uses about 1.1-1.5 GB of RAM, and it does not start with less than 1536 MB free (`bot_desktop.min_free_memory_mb` in `config.yaml`)
- The Bot Screen uses a US keymap, so layout-dependent keys can be wrong during a takeover
- Messaging platforms need their own bot tokens, configured through `setup`
- Only one container may use the data volume at a time, so stop the service before running `setup`
- Dashboard logins reset when the container restarts

## Links & Resources

- **Official Website:** <https://hermes-agent.nousresearch.com>
- **Official GitHub:** <https://github.com/NousResearch/hermes-agent>
- **Documentation:** <https://hermes-agent.nousresearch.com/docs>
- **Docker Hub:** <https://hub.docker.com/r/nousresearch/hermes-agent>
- **Hindsight:** <https://hindsight.vectorize.io>
- **Hindsight GitHub:** <https://github.com/vectorize-io/hindsight>
- **Hindsight with Hermes:** <https://hindsight.vectorize.io/sdks/integrations/hermes>
