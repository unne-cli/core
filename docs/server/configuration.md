# Server Configuration

## Config File

Default location: same directory as the binary (`config.yml`) or specified with `--config`.

```yaml
server:
  domain: "unne.site"   # Your domain
  control_port: 8222             # Port for CLI connections
  http_port: 8223                # Port for HTTP proxy

storage:
  database: "/etc/unne/unne.db"  # SQLite database path

logging:
  file_path: "/var/log/unne/server.log"

subdomain:
  format: "random"               # random, uuid, ulid, factory

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
# → unne.site

# Set a value
unns config set server.domain newunne.site

# List all values
unns config list
# → server.domain = unne.site
# → server.control_port = 8222
# → server.http_port = 8223
# → storage.database = /etc/unne/unne.db
# → ...
```

## Custom Config Path

```bash
unns --config /path/to/config.yml
```

## Subdomain Format

Configure the format for auto-generated subdomain endpoints:

```yaml
subdomain:
  format: "random"   # default
```

| Format | Example | Description |
|--------|---------|-------------|
| `random` | `k1qgjzv6` | 8-char random alphanumeric string (default) |
| `uuid` | `550e8400-e29b-41d4-a716-446655440000` | UUID v4 (36 chars) |
| `ulid` | `01arz3ndektsv4rrffq69g5fav` | ULID — sortable, time-based (26 chars, Crockford base32) |
| `factory` | `swift-bear` | Human-readable adjective-noun combination |

The format can be changed at runtime via the admin API (`PUT /settings`) or in the config file. The value is persisted to the database and takes priority over the config file.

```bash
# Change subdomain format via config
unns config set subdomain.format ulid
```

Users can still override with `--subdomain myapp` on the CLI side. If a requested subdomain is already taken, the server returns an error for manual requests or auto-regenerates for automatic ones.

## Config Reference

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `server.domain` | string | — | Server domain for subdomains |
| `subdomain.format` | string | `random` | Subdomain format: `random`, `uuid`, `ulid`, `factory` |
| `server.control_port` | int | `8222` | CLI connection port |
| `server.http_port` | int | `8223` | HTTP proxy port |
| `storage.database` | string | `/etc/unne/unne.db` | SQLite database path |
| `logging.file_path` | string | — | Log file path |
| `admin.enabled` | bool | `true` | Enable admin panel |
| `admin.port` | int | `4041` | Admin panel port |
| `admin.session_ttl` | string | `24h` | Admin session duration |
