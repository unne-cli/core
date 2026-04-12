# 管理 API 参考

管理面板在管理端口（默认：`4041`）上暴露了一组 REST API。

除 `/api/auth/login` 外，所有端点都需要管理员会话 Cookie。

## 认证

### 登录

```
POST /api/auth/login
Content-Type: application/json

{"username": "admin", "password": "secret"}
```

**响应：**
```json
{
  "user": {"id": 1, "username": "admin", "role": "admin"}
}
```

设置 `unne_admin_session` Cookie。

### 登出

```
POST /api/auth/logout
```

### 当前用户

```
GET /api/auth/me
```

---

## 用户

### 获取用户列表

```
GET /api/users
```

### 创建用户

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

### 获取用户详情

```
GET /api/users/:id
```

返回用户详情 + 流量使用情况 + 活跃令牌数量。

### 更新用户

```
PUT /api/users/:id
Content-Type: application/json

{"max_tunnels": 10, "enabled": true}
```

只需包含你想要修改的字段。

### 删除用户

```
DELETE /api/users/:id
```

级联删除关联令牌。

---

## 令牌

### 获取用户令牌列表

```
GET /api/users/:id/tokens
```

### 生成令牌

```
POST /api/users/:id/tokens
Content-Type: application/json

{"device_name": "macbook"}
```

**响应：**
```json
{
  "token": "a1b2c3d4...",
  "token_id": 5,
  "message": "Save this token — it will only be shown once."
}
```

### 撤销令牌

```
DELETE /api/tokens/:id
```

---

## 仪表盘

### 概要

```
GET /api/dashboard
```

**响应：**
```json
{
  "total_users": 12,
  "active_tunnels": 5,
  "traffic_today": 1048576,
  "top_users": [...]
}
```

### 活跃隧道

```
GET /api/tunnels/active
```

**响应：**
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

### 流量分析

```
GET /api/analytics/traffic?days=30
GET /api/analytics/traffic?user_id=1&days=7
```
