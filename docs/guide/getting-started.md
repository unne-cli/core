# Getting Started

## Prerequisites

- A VPS or server with a public IP address
- A domain with wildcard DNS configured (`*.yourdomain.com → server IP`)

## Quick Setup

### 1. Set Up the Server

On your VPS:

```bash
# One-line install (auto-detects OS/arch, runs setup)
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

Or download manually from [GitHub Releases](https://github.com/unne-cli/core/releases).

The setup wizard will ask for:
- Server domain (e.g., `tunnel.example.com`)
- Control port (default: `8222`)
- HTTP proxy port (default: `8223`)
- Admin panel settings
- Admin credentials

### 2. Configure DNS

Point a wildcard DNS record to your server:

```
*.tunnel.example.com → YOUR_SERVER_IP
```

### 3. Install the CLI

On your local machine — download from [Releases](https://github.com/unne-cli/core/releases), then:

```bash
# Configure the client
unne setup
```

Enter your server address, port, and auth token when prompted.

### 4. Create Your First Tunnel

```bash
# Start a local web server (example)
python3 -m http.server 8080

# In another terminal, create a tunnel
unne http 8080
```

Your local server is now accessible at `https://random.tunnel.example.com`.

## What's Next?

- [CLI Configuration](/cli/configuration) — Learn about `unne.yml` config files
- [HTTP Tunnels](/cli/http-tunnels) — Custom subdomains, multiple tunnels
- [TCP Tunnels](/cli/tcp-tunnels) — Database and SSH tunnels
- [Server Setup](/server/setup) — Detailed server configuration
- [User Management](/server/users) — Creating users and setting limits
