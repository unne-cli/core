# Unne CLI Overview

Unne CLI is the client application that creates tunnels from your local machine to an Unne Server.

## Commands

| Command | Description |
|---------|-------------|
| `unne setup` | Interactive first-time configuration |
| `unne http <port>` | Quick HTTP tunnel on a local port |
| `unne tcp <port>` | Quick TCP tunnel on a local port |
| `unne start` | Start tunnels defined in `unne.yml` |
| `unne check` | Verify server connectivity |
| `unne version` | Show version info |
| `unne help` | Show help |

## Global Flags

| Flag | Description |
|------|-------------|
| `--config <path>` | Path to config file (default: `unne.yml`) |
| `--subdomain <name>` | Desired subdomain (HTTP only) |
| `--remote-port <port>` | Remote port (TCP only) |
| `--proxy <url>` | Proxy URL (`socks5://` or `http://`) |
| `--skip-warning`, `--sw` | Skip browser warning page |
| `--no-tui` | Disable TUI, use log-only output |
| `--webui` | Enable web inspector |
| `--webui-port <port>` | Web inspector port (default: `4040`) |

## Quick Examples

```bash
# Expose a local web app
unne http 3000

# Expose with a custom subdomain
unne http 3000 --subdomain myapp

# TCP tunnel for PostgreSQL
unne tcp 5432 --remote-port 15432

# Start all tunnels from config with web inspector
unne start --webui

# Headless mode through a proxy
unne http 8080 --no-tui --proxy socks5://127.0.0.1:1080
```
