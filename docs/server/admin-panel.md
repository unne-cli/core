# Admin Panel

The Admin Panel is a web-based dashboard for managing the Unne Server. It runs on the server alongside the tunnel services.

## Enabling

In `config.yml`:

```yaml
admin:
  enabled: true
  port: 4041
  session_ttl: "24h"
```

Access at `http://your-server:4041`.

## Login

Use the admin credentials created during `unns setup`. Only users with `role: admin` can access the panel.

## Dashboard

The dashboard shows:
- **Total users** — registered user count
- **Active tunnels** — currently connected tunnels
- **Traffic today** — total bytes transferred today
- **Top users** — users ranked by traffic (30 days)

## Users Page

Manage all users with full CRUD:
- Create users with roles and limits
- Edit user settings (protocols, limits, quotas)
- Enable/disable accounts
- Delete users (cascades to tokens)

## Tokens Page

Per-user token management:
- Generate new tokens with device names
- View token status and last usage
- Revoke tokens instantly

## Active Tunnels

Real-time view of all connected tunnels:
- Endpoint (subdomain or port)
- Protocol (HTTP/TCP)
- Connected user
- Connection duration
- Traffic counters (bytes in/out)

## Analytics

Traffic statistics:
- Per-user traffic breakdown
- Daily/monthly aggregation
- Top users by bandwidth

## Security

- Session-based authentication (HttpOnly cookies)
- bcrypt password hashing
- Admin-only access (`role: admin`)
- Sessions expire after the configured TTL (default: 24h)

::: warning
The admin panel does not have built-in HTTPS. Use a reverse proxy (Nginx/Caddy) to add TLS encryption in production.
:::
