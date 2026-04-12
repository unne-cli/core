# Limits & Quotas

Unne Server supports per-user limits to control resource usage.

## Available Limits

| Limit | Description | Default |
|-------|-------------|---------|
| `max_tunnels` | Max simultaneous tunnels | `0` (unlimited) |
| `max_devices` | Max simultaneous token connections | `0` (unlimited) |
| `allowed_protocols` | Allowed tunnel protocols | `http,tcp` |
| `traffic_limit` | Max traffic per period (bytes) | `0` (unlimited) |
| `traffic_period` | Limit period: `daily`, `monthly`, `quarterly` | `monthly` |
| `skip_warning` | Allow clients to skip browser warning | `false` |
| `can_use_proxy` | Allow proxy connections | `true` |

## How Limits Are Enforced

Limits are checked during the handshake when a client connects:

1. **Token validation** — token exists and is enabled
2. **User validation** — user exists and is enabled
3. **Protocol check** — requested protocol is in `allowed_protocols`
4. **Device limit** — count of unique active tokens for this user
5. **Tunnel limit** — count of active tunnels for this user
6. **Traffic limit** — accumulated bytes for the current period

If any check fails, the connection is rejected with the appropriate `STATUS_UNNE_*` error code.

## Traffic Tracking

Traffic is tracked per-tunnel and flushed to the database every 30 seconds. The counters include both inbound and outbound bytes.

### Traffic Periods

| Period | Reset |
|--------|-------|
| `daily` | Midnight (server timezone) |
| `monthly` | 1st of each month |
| `quarterly` | Jan 1, Apr 1, Jul 1, Oct 1 |

## Examples

### Free tier: HTTP only, 3 tunnels, 1GB/month

```
max_tunnels: 3
allowed_protocols: http
traffic_limit: 1073741824
traffic_period: monthly
max_devices: 1
```

### Pro tier: unlimited

```
max_tunnels: 0
allowed_protocols: http,tcp
traffic_limit: 0
max_devices: 0
skip_warning: true
```

## Setting Limits

Limits can be set via:
- **Admin Panel** — edit user form
- **CLI** — `unns user create` (basic), then edit via admin panel for detailed limits
