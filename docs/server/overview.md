# Unne Server Overview

Unne Server is the relay component that accepts tunnel connections from CLI clients and routes traffic from the internet to connected tunnels.

## Commands

| Command | Description |
|---------|-------------|
| `unns` | Start the server |
| `unns setup` | Interactive initial configuration |
| `unns config get <key>` | Get a config value |
| `unns config set <key> <value>` | Set a config value |
| `unns config list` | List all config values |
| `unns user create <user> <pass> [role]` | Create a user |
| `unns user list` | List all users |
| `unns user delete <id>` | Delete a user |
| `unns token gen <user_id> [device]` | Generate a token |
| `unns token list [user_id]` | List tokens |
| `unns token revoke <token_id>` | Revoke a token |
| `unns setup-check` | Print server info for CLI setup |

## Ports

| Port | Purpose |
|------|---------|
| Control (default: `8222`) | CLI client connections (yamux) |
| HTTP Proxy (default: `8223`) | Public HTTP traffic routing |
| Admin Panel (default: `4041`) | Web-based administration |
| TCP (dynamic) | Per-tunnel TCP listeners |

## Storage

Unne Server uses SQLite for data persistence:

- **Users** — accounts with roles and limits
- **Tokens** — auth tokens bound to users and devices
- **Sessions** — admin panel login sessions
- **Traffic Log** — per-user traffic tracking for quotas
