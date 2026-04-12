# Admin API Reference

The Admin Panel exposes a REST API on the admin port (default: `4041`).

All endpoints except `/api/auth/login` require an admin session cookie.

## Authentication

### Login

```
POST /api/auth/login
Content-Type: application/json

{"username": "admin", "password": "secret"}
```

**Response:**
```json
{
  "user": {"id": 1, "username": "admin", "role": "admin"}
}
```

Sets `unne_admin_session` cookie.

### Logout

```
POST /api/auth/logout
```

### Current User

```
GET /api/auth/me
```

---

## Users

### List Users

```
GET /api/users
```

### Create User

```
POST /api/users
Content-Type: application/json

{
  "username": "john",
  "password": "secret",
  "role": "user",
  "max_tunnels": 5,
  "allowed_protocols": "http,tcp",
  "traffic_limit": 1073741824,
  "traffic_period": "monthly",
  "max_devices": 2,
  "skip_warning": false,
  "can_use_proxy": true
}
```

### Get User

```
GET /api/users/:id
```

Returns user details + traffic usage + active token count.

### Update User

```
PUT /api/users/:id
Content-Type: application/json

{"max_tunnels": 10, "enabled": true}
```

Only include fields you want to change.

### Delete User

```
DELETE /api/users/:id
```

Cascades to tokens.

---

## Tokens

### List User Tokens

```
GET /api/users/:id/tokens
```

### Generate Token

```
POST /api/users/:id/tokens
Content-Type: application/json

{"device_name": "macbook"}
```

**Response:**
```json
{
  "token": "a1b2c3d4...",
  "token_id": 5,
  "message": "Save this token — it will only be shown once."
}
```

### Revoke Token

```
DELETE /api/tokens/:id
```

---

## Dashboard

### Summary

```
GET /api/dashboard
```

**Response:**
```json
{
  "total_users": 12,
  "active_tunnels": 5,
  "traffic_today": 1048576,
  "top_users": [...]
}
```

### Active Tunnels

```
GET /api/tunnels/active
```

**Response:**
```json
[
  {
    "subdomain": "myapp",
    "protocol": "http",
    "user_id": 1,
    "username": "john",
    "connected_at": "2026-04-12 15:00:00",
    "bytes_in": 12345,
    "bytes_out": 67890
  }
]
```

### Traffic Analytics

```
GET /api/analytics/traffic?days=30
GET /api/analytics/traffic?user_id=1&days=7
```
