# Proxy Support

Unne CLI can route its server connection through HTTP or SOCKS5 proxies.

## Usage

### CLI Flag

```bash
unne http 3000 --proxy socks5://127.0.0.1:1080
unne http 3000 --proxy http://user:pass@proxy.corp.com:8080
```

### Config File

Global proxy (for all tunnels):

```yaml
proxy:
  url: "socks5://127.0.0.1:1080"
```

Per-tunnel proxy:

```yaml
tunnels:
  - name: web
    protocol: http
    upstream: localhost:3000
    proxy:
      url: "http://corpproxy:8080"
```

## Supported Proxy Types

| Scheme | Protocol | Authentication |
|--------|----------|---------------|
| `socks5://` | SOCKS5 | Username/password via URL |
| `http://` | HTTP CONNECT | Basic auth via URL |
| `https://` | HTTPS CONNECT | Basic auth via URL |

## Authentication

Include credentials in the proxy URL:

```
socks5://user:password@proxy:1080
http://user:password@proxy:8080
```

## Server-Side Restrictions

The server administrator can disable proxy usage per user. If your account doesn't have `can_use_proxy` permission, the proxy setting is ignored at the connection level but does not cause an error.
