# Error Codes

Unne uses standardized error codes prefixed with `STATUS_UNNE_`.

## Error Code Reference

| Code | Description |
|------|-------------|
| `STATUS_UNNE_AUTH_FAILED` | Invalid or expired authentication token |
| `STATUS_UNNE_SUBDOMAIN_TAKEN` | Requested subdomain is already in use |
| `STATUS_UNNE_PROTOCOL_ERROR` | Handshake protocol error (malformed request) |
| `STATUS_UNNE_TUNNEL_LIMIT` | Maximum tunnel limit reached for your account |
| `STATUS_UNNE_PROTOCOL_DENIED` | Your account is not allowed to use this protocol |
| `STATUS_UNNE_TRAFFIC_EXCEEDED` | Traffic limit exceeded for the current period |
| `STATUS_UNNE_DEVICE_LIMIT` | Maximum device limit reached for your account |
| `STATUS_UNNE_USER_DISABLED` | Your user account has been disabled by admin |
| `STATUS_UNNE_TOKEN_DISABLED` | This token has been revoked or disabled |
| `STATUS_UNNE_PORT_UNAVAILABLE` | Requested TCP port is unavailable |
| `STATUS_UNNE_SERVER_ERROR` | Internal server error |

## HTTP Error Pages

When accessing a tunnel via browser, the server shows styled error pages:

| Page | HTTP Status | When |
|------|-------------|------|
| **Warning** | 200 | First visit from browser (confirmation required) |
| **Not Found** | 404 | Tunnel/subdomain doesn't exist |
| **Offline** | 502 | Tunnel exists but upstream is unreachable |
| **Error** | Varies | Generic error with code and description |

## Legacy Error Codes

For backward compatibility with older servers:

| Legacy | New Code |
|--------|----------|
| `UNNE_ERR_403` | `STATUS_UNNE_AUTH_FAILED` |
| `UNNE_ERR_102` | `STATUS_UNNE_SUBDOMAIN_TAKEN` |
| `UNNE_ERR_101` | `STATUS_UNNE_PROTOCOL_ERROR` |
