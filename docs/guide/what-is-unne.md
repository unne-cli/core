# What is Unne?

Unne is a self-hosted tunneling solution that allows you to expose local services to the internet through your own server. Think of it as a self-hosted alternative to ngrok, Cloudflare Tunnel, or localtunnel.

## Components

Unne consists of two parts:

| Component | Description |
|-----------|-------------|
| **Unne CLI** (`unne`) | Client application that runs on your machine and creates tunnels |
| **Unne Server** (`unns`) | Server application that accepts tunnel connections and routes traffic |

## How It Works

```
Internet → Unne Server (your VPS) → Yamux Multiplexing → Unne CLI → Local Service
                                ↑
                    subdomain.yourdomain.com
```

1. You run `unns` on a VPS with a public IP and domain
2. DNS for `*.yourdomain.com` points to your server
3. You run `unne http 3000` on your local machine
4. Unne CLI connects to the server, establishes a multiplexed tunnel
5. Your local service is now accessible at `https://random.yourdomain.com`

## Key Features

- **HTTP tunnels** with custom or auto-generated subdomains
- **TCP tunnels** for databases, SSH, and other protocols
- **TUI dashboard** with mitmproxy-style request inspector
- **Web inspector** with Chrome DevTools Network console style
- **User management** with per-user limits and quotas
- **Admin panel** for server administration
- **Proxy support** (SOCKS5, HTTP CONNECT)
- **Warning pages** for first-time visitors (configurable)

## Protocol

Unne uses [yamux](https://github.com/hashicorp/yamux) for multiplexing multiple streams over a single TCP connection. This allows efficient bidirectional communication between the client and server without opening multiple ports.

## Security

- Tokens are stored as SHA-256 hashes (never in plaintext)
- Admin passwords use bcrypt
- Per-user protocol restrictions and traffic limits
- Browser warning pages for first-time visitors
- Session-based admin authentication
