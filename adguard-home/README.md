# AdGuard Home

Network-wide DNS server that blocks ads and trackers for all devices without requiring client-side software installation.

## What it does

- **Network-wide ad blocking** - Blocks ads and trackers at DNS level for all connected devices
- **Zero client configuration** - Protects phones, tablets, smart TVs, and IoT devices automatically
- **Web-based management** - Easy configuration and monitoring through intuitive interface
- **Modern DNS protocols** - Supports DNS-over-HTTPS (DoH), DNS-over-TLS (DoT), and DNSCrypt
- **Custom filtering** - Create blocklists, allowlists, and parental controls
- **Analytics dashboard** - Comprehensive statistics and query logging

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access setup wizard at `http://localhost:5001`
3. Complete initial configuration and create admin account
4. Configure your router DNS to point to your server's IP address

**Note:** After setup, access admin interface at `http://localhost:5000`.

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `ADGUARD_CONFIG_PORT` | `5001` | Port for initial setup UI |
| `ADGUARD_PORT` | `5000` | Port for AdGuard admin interface |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Custom ports for web interfaces
ADGUARD_CONFIG_PORT=8001 ADGUARD_PORT=8000 docker compose up -d
```

**Note:** DNS ports (53/tcp and 53/udp) are fixed and cannot be changed.

## Network Setup

Configure your router's DNS settings to point to your server's IP address, or manually set DNS on individual devices for testing.

## Limitations

- Cannot block YouTube, Facebook, or Twitch ads (share domains with content)
- Limited effectiveness against first-party advertising
- Some mobile apps may use hardcoded DNS servers
- Browsers using DNS-over-HTTPS may bypass filtering

## Links & Resources

- **Official Website:** <https://adguard.com/adguard-home/overview.html>
- **Official GitHub:** <https://github.com/AdguardTeam/AdGuardHome>
- **Documentation:** <https://github.com/AdguardTeam/AdGuardHome/wiki>
- **Docker Hub:** <https://hub.docker.com/r/adguard/adguardhome>
