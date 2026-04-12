# Server Setup

## Interactive Setup

Run the setup wizard:

```bash
unns setup
```

You'll be prompted for:

1. **Domain** — e.g., `tunnel.example.com`
2. **Control Port** — client connections (default: `8222`)
3. **HTTP Port** — public HTTP proxy (default: `8223`)
4. **Database Path** — SQLite database location (default: `/etc/unne/unne.db`)
5. **Log Path** — log file (default: `/var/log/unne/server.log`)
6. **Admin Panel** — enable/disable, port
7. **Admin Credentials** — username and password

The wizard will:
- Create the config file (`config.yml`)
- Initialize the SQLite database
- Create the admin user
- Generate the first auth token

::: tip Save your token!
The generated token is shown only once. Copy it immediately.
:::

## Manual Setup

If you prefer to set up manually:

### 1. Create config.yml

```yaml
server:
  domain: "tunnel.example.com"
  control_port: 8222
  http_port: 8223
storage:
  database: "/etc/unne/unne.db"
logging:
  file_path: "/var/log/unne/server.log"
admin:
  enabled: true
  port: 4041
  session_ttl: "24h"
```

### 2. Create admin user

```bash
unns user create admin yourpassword admin
```

### 3. Generate a token

```bash
unns token gen 1 my-laptop
```
