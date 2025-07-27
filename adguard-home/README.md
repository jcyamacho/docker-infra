# AdGuard Home

Network-wide DNS server that blocks ads, trackers, and malicious domains for all devices on your network.

## What it does

- **DNS Filtering** - Blocks ads, trackers, and malware at the network level
- **Custom DNS Records** - Create local DNS entries for your network
- **Query Logging** - Monitor and analyze DNS requests across devices
- **Protocol Support** - DNS-over-HTTPS, DNS-over-TLS, and DNSCrypt

## Quick Start

1. Run with Docker Compose: `docker compose up -d`
2. Access configuration at `http://localhost:5001`
3. Complete initial setup wizard
4. Configure devices to use server IP as DNS

**Note:** Port 53 may conflict with systemd-resolved on Ubuntu systems

## Configuration

### Environment Variables

| Variable | Default | Description |
|----|---|----|
| `ADGUARD_VERSION` | `latest` | AdGuard Home Docker image tag |
| `ADGUARD_CONFIG_PORT` | `5001` | Configuration interface port |
| `ADGUARD_PORT` | `5000` | Admin interface port |

### Usage Examples

```bash
# Basic usage
docker compose up -d

# Custom ports
ADGUARD_CONFIG_PORT=3000 ADGUARD_PORT=8080 docker compose up -d

# Specific version
ADGUARD_VERSION=v0.107.63 docker compose up -d
```

**Note:** Configure your router's DHCP to use this server's IP as DNS for network-wide filtering

## Limitations

- Cannot block YouTube, Facebook, or Twitch ads (share domains with content)
- Requires port 53 access (may conflict with system DNS)
- Initial configuration must be done through web interface

## Links & Resources

- **Official Website:** <https://adguard.com/adguard-home/overview.html>
- **Official GitHub:** <https://github.com/AdguardTeam/AdGuardHome>
- **Documentation:** <https://adguard-dns.io/kb/adguard-home/getting-started/>
- **Docker Hub:** <https://hub.docker.com/r/adguard/adguardhome>
