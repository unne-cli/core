# مرجع API للوحة الإدارة

تكشف لوحة الإدارة واجهة REST API على منفذ الإدارة (الافتراضي: `4041`).

جميع نقاط النهاية باستثناء `/api/auth/login` تتطلب كوكي جلسة مدير.

## المصادقة

### تسجيل الدخول

```
POST /api/auth/login
Content-Type: application/json

{"username": "admin", "password": "secret"}
```

**الاستجابة:**
```json
{
  "user": {"id": 1, "username": "admin", "role": "admin"}
}
```

يُعيّن كوكي `unne_admin_session`.

### تسجيل الخروج

```
POST /api/auth/logout
```

### المستخدم الحالي

```
GET /api/auth/me
```

---

## المستخدمون

### سرد المستخدمين

```
GET /api/users
```

### إنشاء مستخدم

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

### الحصول على مستخدم

```
GET /api/users/:id
```

يُرجع تفاصيل المستخدم + استخدام حركة المرور + عدد الرموز النشطة.

### تحديث مستخدم

```
PUT /api/users/:id
Content-Type: application/json

{"max_tunnels": 10, "enabled": true}
```

أدرج فقط الحقول التي تريد تغييرها.

### حذف مستخدم

```
DELETE /api/users/:id
```

يحذف الرموز المرتبطة أيضاً.

---

## الرموز

### سرد رموز المستخدم

```
GET /api/users/:id/tokens
```

### إنشاء رمز

```
POST /api/users/:id/tokens
Content-Type: application/json

{"device_name": "macbook"}
```

**الاستجابة:**
```json
{
  "token": "a1b2c3d4...",
  "token_id": 5,
  "message": "Save this token — it will only be shown once."
}
```

### إلغاء رمز

```
DELETE /api/tokens/:id
```

---

## لوحة المعلومات

### الملخص

```
GET /api/dashboard
```

**الاستجابة:**
```json
{
  "total_users": 12,
  "active_tunnels": 5,
  "traffic_today": 1048576,
  "top_users": [...]
}
```

### الأنفاق النشطة

```
GET /api/tunnels/active
```

**الاستجابة:**
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

### تحليلات حركة المرور

```
GET /api/analytics/traffic?days=30
GET /api/analytics/traffic?user_id=1&days=7
```
