# User Management

Unne Server has a full user management system with per-user limits and access control.

## CLI Commands

```bash
# Create a user
unns user create john p@ssw0rd

# Create an admin
unns user create admin secret admin

# List users
unns user list

# Delete a user (cascades to tokens)
unns user delete 3
```

## User Properties

| Field | Description | Default |
|-------|-------------|---------|
| `username` | Unique login name | — |
| `password` | Hashed with bcrypt | — |
| `role` | `admin` or `user` | `user` |
| `enabled` | Account active/disabled | `true` |
| `max_tunnels` | Max simultaneous tunnels (`0` = unlimited) | `0` |
| `allowed_protocols` | Comma-separated: `http`, `tcp`, or `http,tcp` | `http,tcp` |
| `traffic_limit` | Max bytes per period (`0` = unlimited) | `0` |
| `traffic_period` | `daily`, `monthly`, or `quarterly` | `monthly` |
| `max_devices` | Max tokens/devices (`0` = unlimited) | `0` |
| `skip_warning` | Allow skipping browser warning | `false` |
| `can_use_proxy` | Allow proxy usage | `true` |

## Access Control Examples

### HTTP-only user, 5 tunnels max

```bash
unns user create webdev pass123
# Then via admin panel: set allowed_protocols=http, max_tunnels=5
```

### User with 1GB monthly limit

Set `traffic_limit=1073741824` (1GB in bytes) and `traffic_period=monthly` via the admin panel.

### Single-device user

Set `max_devices=1` — only one token can be active. Each token represents one device.

## Admin Panel

Users can also be managed through the web-based admin panel at `http://localhost:4041`. See [Admin Panel](/server/admin-panel).
