# CLI Configuration

Unne CLI uses two configuration files that are merged together:

## Global Settings (`~/.unne/settings.yml`)

Created by `unne setup`. Contains server connection info:

```yaml
server: "unne.site"
port: 8222
authtoken: "your-auth-token"
```

## Project Config (`unne.yml`)

Place in your project root to define tunnels:

```yaml
version: "3"

# Override global settings (optional)
# server: "unne.site"
# port: 8222
# authtoken: "your-auth-token"

# Proxy for all connections (optional)
# proxy:
#   url: "socks5://127.0.0.1:1080"

# GUI settings
gui:
  tui: true           # Enable terminal UI
  webui: false        # Enable web inspector
  webui_port: 4040    # Web inspector port

# Skip browser warning page
# skip_warning: true

tunnels:
  - name: web-app
    protocol: http
    subdomain: myapp        # optional, auto-generated if omitted
    upstream: localhost:3000

  - name: api
    protocol: http
    upstream: localhost:8080

  - name: postgres
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432
```

## Config Merging

Settings are merged in this order (later overrides earlier):

1. `~/.unne/settings.yml` (global defaults)
2. `unne.yml` (project config)
3. CLI flags (`--proxy`, `--subdomain`, etc.)

## Using a Custom Config Path

```bash
unne start --config /path/to/custom.yml
```
