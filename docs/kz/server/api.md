# Әкімші API анықтамалығы

Әкімші панелі әкімші портында (әдепкі: `4041`) REST API ұсынады.

`/api/auth/login` нүктесінен басқа барлық соңғы нүктелер әкімші сессия cookie-сін талап етеді.

## Аутентификация

### Кіру

```
POST /api/auth/login
Content-Type: application/json

{"username": "admin", "password": "secret"}
```

**Жауап:**
```json
{
  "user": {"id": 1, "username": "admin", "role": "admin"}
}
```

`unne_admin_session` cookie орнатылады.

### Шығу

```
POST /api/auth/logout
```

### Ағымдағы пайдаланушы

```
GET /api/auth/me
```

---

## Пайдаланушылар

### Пайдаланушылар тізімі

```
GET /api/users
```

### Пайдаланушы жасау

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

### Пайдаланушыны алу

```
GET /api/users/:id
```

Пайдаланушы мәліметтерін + трафик қолданысын + белсенді токен санын қайтарады.

### Пайдаланушыны жаңарту

```
PUT /api/users/:id
Content-Type: application/json

{"max_tunnels": 10, "enabled": true}
```

Тек өзгерткіңіз келетін өрістерді қосыңыз.

### Пайдаланушыны жою

```
DELETE /api/users/:id
```

Токендер де жойылады.

---

## Токендер

### Пайдаланушы токендерінің тізімі

```
GET /api/users/:id/tokens
```

### Токен генерациялау

```
POST /api/users/:id/tokens
Content-Type: application/json

{"device_name": "macbook"}
```

**Жауап:**
```json
{
  "token": "a1b2c3d4...",
  "token_id": 5,
  "message": "Save this token — it will only be shown once."
}
```

### Токенді қайтарып алу

```
DELETE /api/tokens/:id
```

---

## Бақылау тақтасы

### Жиынтық

```
GET /api/dashboard
```

**Жауап:**
```json
{
  "total_users": 12,
  "active_tunnels": 5,
  "traffic_today": 1048576,
  "top_users": [...]
}
```

### Белсенді туннельдер

```
GET /api/tunnels/active
```

**Жауап:**
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

### Трафик аналитикасы

```
GET /api/analytics/traffic?days=30
GET /api/analytics/traffic?user_id=1&days=7
```
