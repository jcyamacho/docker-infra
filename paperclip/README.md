# Paperclip

Open-source control plane that runs a company of AI agents with an org chart, goals, budgets, and approvals.

## What it does

- **Agent Org Chart** - Hire agents into roles with reporting lines tied to company goals
- **Bring Your Own Agent** - Claude Code, Codex, Gemini CLI, OpenCode, and custom process or HTTP adapters
- **Cost Control** - Monthly budgets per agent with hard stops
- **Tickets and Audit Trail** - Tasks trace back to goals, with tool-call traces and an append-only log
- **Governance** - Approval gates for hires, plus pause, resume, and terminate for any agent
- **Scheduled Routines** - Heartbeats and routines triggered by cron, webhooks, or the API

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access the web interface at `http://localhost:3100`
3. Create an account, then choose **Claim this instance** to become the first admin
4. Follow the onboarding to create your first company

**Note:** Agents need an LLM provider key. Export `ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, or `GEMINI_API_KEY` before starting; the image already includes the Claude Code, Codex, Gemini CLI, and OpenCode CLIs.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PAPERCLIP_VERSION` | `latest` | Paperclip image tag |
| `PAPERCLIP_PORT` | `3100` | Host port for the web interface and API (also sets `PAPERCLIP_PUBLIC_URL`) |
| `PAPERCLIP_AUTH_SECRET` | `paperclip-local-dev-auth-secret-0123456789` | Session signing secret (sets `BETTER_AUTH_SECRET`) |
| `PAPERCLIP_TOOL_ACTION_SECRET` | `paperclip-local-dev-tool-secret-0123456789` | Signing secret for approval-gated tool actions (sets `PAPERCLIP_TOOL_ACTION_SIGNING_SECRET`) |
| `ANTHROPIC_API_KEY` | empty | Anthropic API key for Claude Code agents |
| `OPENAI_API_KEY` | empty | OpenAI API key for Codex agents |
| `GEMINI_API_KEY` | empty | Google API key for Gemini CLI agents |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Claude Code agents with an Anthropic API key
ANTHROPIC_API_KEY=sk-ant-... docker compose up -d

# Custom port and version
PAPERCLIP_PORT=3200 PAPERCLIP_VERSION=2026.1106.0 docker compose up -d

# Custom secrets (reuse the same values on every start)
PAPERCLIP_AUTH_SECRET=my-long-random-secret PAPERCLIP_TOOL_ACTION_SECRET=another-long-random-secret docker compose up -d
```

**Note:** The port is published on `127.0.0.1` only, because the web interface gives access to agents that run shell commands. The embedded PostgreSQL database, uploads, secrets key, and agent workspaces are stored in the `paperclip_data` volume.

## Limitations

- Requires an LLM provider API key (not included)
- The default secrets are public development values; set your own before storing real credentials
- Agents run their shell commands inside this container
- Uses the embedded PostgreSQL database; an external database needs `DATABASE_URL`, which is not configured
- Reachable from `localhost` only; LAN or public access needs a public URL, allowed hostnames, and TLS
- The image bundles several agent CLIs, so the first pull is large

## Links & Resources

- **Official Website:** <https://paperclip.ing>
- **Official GitHub:** <https://github.com/paperclipai/paperclip>
- **Documentation:** <https://docs.paperclip.ing>
- **Container Image:** <https://github.com/paperclipai/paperclip/pkgs/container/paperclip>
