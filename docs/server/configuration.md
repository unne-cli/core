# Server Configuration

## Config File

Default location: same directory as the binary (`config.yml`) or specified with `--config`.

```yaml
server:
  domain: "tunnel.example.com"   # Your domain
  control_port: 8222             # Port for CLI connections
  http_port: 8223                # Port for HTTP proxy

storage:
  database: "/etc/unne/unne.db"  # SQLite database path

logging:
  file_path: "/var/log/unne/server.log"

admin:
  enabled: true                  # Enable admin panel
  port: 4041                     # Admin panel port
  session_ttl: "24h"             # Admin session duration
```

## Git-Style Config Commands

Read and modify config values without editing YAML manually:

```bash
# Get a value
unns config get server.domain
# → tunnel.example.com

# Set a value
unns config set server.domain newtunnel.example.com

# List all values
unns config list
# → server.domain = tunnel.example.com
# → server.control_port = 8222
# → server.http_port = 8223
# → storage.database = /etc/unne/unne.db
# → ...
```

## Custom Config Path

```bash
unns --config /path/to/config.yml
```

## Config Reference

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `server.domain` | string | — | Server domain for subdomains |
| `server.control_port` | int | `8222` | CLI connection port |
| `server.http_port` | int | `8223` | HTTP proxy port |
| `storage.database` | string | `/etc/unne/unne.db` | SQLite database path |
| `logging.file_path` | string | — | Log file path |
| `admin.enabled` | bool | `true` | Enable admin panel |
| `admin.port` | int | `4041` | Admin panel port |
| `admin.session_ttl` | string | `24h` | Admin session duration |
