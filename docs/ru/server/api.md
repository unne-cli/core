# Справочник Admin API

Панель администратора предоставляет REST API на порту администратора (по умолчанию: `4041`).

Все эндпоинты, кроме `/api/auth/login`, требуют cookie сессии администратора.

## Аутентификация

### Вход

```
POST /api/auth/login
Content-Type: application/json

{"username": "admin", "password": "secret"}
```

**Ответ:**
```json
{
  "user": {"id": 1, "username": "admin", "role": "admin"}
}
```

Устанавливает cookie `unne_admin_session`.

### Выход

```
POST /api/auth/logout
```

### Текущий пользователь

```
GET /api/auth/me
```

---

## Пользователи

### Список пользователей

```
GET /api/users
```

### Создание пользователя

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

### Получение пользователя

```
GET /api/users/:id
```

Возвращает данные пользователя + использование трафика + количество активных токенов.

### Обновление пользователя

```
PUT /api/users/:id
Content-Type: application/json

{"max_tunnels": 10, "enabled": true}
```

Включайте только те поля, которые хотите изменить.

### Удаление пользователя

```
DELETE /api/users/:id
```

Каскадно удаляет токены.

---

## Токены

### Список токенов пользователя

```
GET /api/users/:id/tokens
```

### Генерация токена

```
POST /api/users/:id/tokens
Content-Type: application/json

{"device_name": "macbook"}
```

**Ответ:**
```json
{
  "token": "a1b2c3d4...",
  "token_id": 5,
  "message": "Save this token — it will only be shown once."
}
```

### Отзыв токена

```
DELETE /api/tokens/:id
```

---

## Дашборд

### Сводка

```
GET /api/dashboard
```

**Ответ:**
```json
{
  "total_users": 12,
  "active_tunnels": 5,
  "traffic_today": 1048576,
  "top_users": [...]
}
```

### Активные туннели

```
GET /api/tunnels/active
```

**Ответ:**
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

### Аналитика трафика

```
GET /api/analytics/traffic?days=30
GET /api/analytics/traffic?user_id=1&days=7
```
