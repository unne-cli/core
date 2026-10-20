# Getting Started

## Prerequisites

- A VPS or server with a public IP address
- A domain with wildcard DNS configured (`*.yourdomain.com → server IP`)

## Quick Setup

### 1. Set Up the Server

On your VPS:

```bash
# One-line install (auto-detects OS/arch, runs setup)
curl -fsSL https://unne.site/server/install | sudo bash
```

Or download manually from [GitHub Releases](https://github.com/unne-cli/core/releases).

The setup wizard will ask for:
- Server domain (e.g., `unne.site`)
- Control port (default: `8222`)
- HTTP proxy port (default: `8223`)
- Admin panel settings
- Admin credentials

Then create a user and a token for your computer in the admin panel (*Users → user → Devices & tokens*).

### 2. Configure DNS

Point a wildcard DNS record to your server:

```
*.unne.site → YOUR_SERVER_IP
```

### 3. Install the Unne App

On your computer, pick one:

- **Desktop app** — download [Unne for macOS](https://github.com/unne-cli/core/releases/latest/download/Unne-macOS.zip) or [Unne for Windows](https://github.com/unne-cli/core/releases/latest/download/unne-app-windows-amd64.exe) and open it. On first launch it asks for your server, port and token, then offers to install itself.
- **Command line** — `curl -fsSL https://unne.site/cli/install | bash` (Windows: `irm https://unne.site/cli/install.ps1 | iex`), then run `unne setup` and enter your server address, port and token.

### 4. Create Your First Tunnel

In the app: **New tunnel** → enter the local port → **Create tunnel**.

Or in a terminal:

```bash
# Start a local web server (example)
python3 -m http.server 8080

# In another terminal, create a tunnel
unne http 8080
```

Your local server is now accessible at `https://random.unne.site`.

## What's Next?

- [Desktop App](/cli/desktop) — Tray icon, window, installation
- [Autostart](/cli/autostart) — Start tunnels when the computer turns on
- [Configuration](/cli/configuration) — Learn about `unne.yml` config files
- [HTTP Tunnels](/cli/http-tunnels) — Custom subdomains, multiple tunnels
- [TCP Tunnels](/cli/tcp-tunnels) — Database and SSH tunnels
- [Server Setup](/server/setup) — Detailed server configuration
- [User Management](/server/users) — Creating users and setting limits
