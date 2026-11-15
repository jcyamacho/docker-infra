# OpenClaw

Self-hosted personal AI assistant that you message from chat apps, with shell, browser, memory, and skills.

## What it does

- **Personal Agent Gateway** - One self-hosted gateway runs your agents, sessions, and tools
- **Chat Channels** - Talk to the agent from WhatsApp, Telegram, Discord, Slack, Signal, and more
- **Shell and Files** - Runs commands and edits files in its workspace
- **Managed Browser** - Drives the Chromium bundled in the image, with a live view in the Control UI
- **Memory and Skills** - Remembers across conversations and installs skills from ClawHub
- **Any Model Provider** - Anthropic, OpenAI, OpenRouter, Google, or a local Ollama or LM Studio

## Quick Start

1. Configure a model provider with the onboarding command below
2. Run with Docker Compose: `docker compose up -d`
3. Access the Control UI at `http://localhost:18789` and enter `openclaw-local-dev-token` as the **Gateway secret**
4. If the Control UI asks to pair the browser, approve it with `devices approve` (see Usage Examples)

```bash
# Interactive onboarding; the gateway token stays in OPENCLAW_GATEWAY_TOKEN
docker compose run --rm openclaw openclaw onboard --mode local --no-install-daemon \
  --gateway-auth token --gateway-token-ref-env OPENCLAW_GATEWAY_TOKEN \
  --skip-ui --suppress-gateway-token-output
```

**Note:** To use a local Ollama, choose Ollama during onboarding with `http://host.docker.internal:11434`.

On every start, the container pins the settings the gateway needs in Docker: `gateway.mode=local`, `gateway.bind=lan`, the Control UI origins for `OPENCLAW_PORT`, and `browser.noSandbox=true`.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `OPENCLAW_VERSION` | `latest` | OpenClaw release tag; the compose file adds the `-browser` image suffix |
| `OPENCLAW_PORT` | `18789` | Host port for the Control UI and Gateway API |
| `OPENCLAW_GATEWAY_TOKEN` | `openclaw-local-dev-token` | Gateway secret for the Control UI and API clients |

Provider credentials, channels, agents, and the workspace are stored in the `openclaw_data` volume, written by onboarding and the Control UI.

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Run CLI commands inside the running gateway
docker compose exec openclaw openclaw status
docker compose exec openclaw openclaw tui

# Approve the browser if the Control UI asks for device pairing
docker compose exec openclaw openclaw devices list
docker compose exec openclaw openclaw devices approve <requestId>

# Connect a Telegram bot
docker compose exec openclaw openclaw channels add --channel telegram --token <bot-token>

# Custom port, token, and version
OPENCLAW_PORT=18800 OPENCLAW_GATEWAY_TOKEN=my-long-secret OPENCLAW_VERSION=2026.11.3 docker compose up -d
```

**Note:** The port is published on `127.0.0.1` only, because the Control UI gives access to an agent that runs shell commands.

## Limitations

- Requires an LLM provider API key, a subscription login, or a local model server (not included)
- The agent runs shell commands inside this container, where the gateway's stored credentials are readable; OpenClaw's Docker sandbox needs the host Docker socket and is not configured
- Chromium runs without its own sandbox (`browser.noSandbox`); the container is the isolation boundary
- Changes to the pinned Docker settings are overwritten on the next start
- Only one container may use the data volume at a time, so stop the service before running onboarding again
- The image runs as a non-root user without apt or Homebrew; skills that need system packages require a custom image

## Links & Resources

- **Official Website:** <https://openclaw.ai>
- **Official GitHub:** <https://github.com/openclaw/openclaw>
- **Documentation:** <https://docs.openclaw.ai>
- **Docker Guide:** <https://docs.openclaw.ai/install/docker>
- **Container Image:** <https://github.com/openclaw/openclaw/pkgs/container/openclaw>
