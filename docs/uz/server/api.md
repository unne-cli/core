# Admin API ma'lumotnomasi

Unne Server admin paneli REST API ni taqdim etadi. Barcha so'rovlar (login dan tashqari) autentifikatsiyani talab qiladi.

## Autentifikatsiya

Admin API sessiyaga asoslangan cookie autentifikatsiyasidan foydalanadi.

### Kirish

```
POST /api/auth/login
```

**So'rov tanasi:**

```json
{
  "username": "admin",
  "password": "your-password"
}
```

**Muvaffaqiyatli javob (200):**

```json
{
  "user": {
    "id": 1,
    "username": "admin",
    "role": "admin"
  }
}
```

Javob `unne_admin_session` cookie ni o'rnatadi. Keyingi so'rovlarda ushbu cookie ni yuborish kerak.

**Xato javoblari:**
- `401` -- Noto'g'ri hisob ma'lumotlari
- `403` -- Foydalanuvchi admin emas

### Chiqish

```
POST /api/auth/logout
```

### Joriy foydalanuvchi

```
GET /api/auth/me
```

**Javob:**

```json
{
  "id": 1,
  "username": "admin",
  "role": "admin"
}
```

## Boshqaruv paneli

### Bosh sahifa ma'lumotlari

```
GET /api/dashboard
```

**Javob:**

```json
{
  "total_users": 15,
  "active_tunnels": 8,
  "traffic_today": 1073741824,
  "top_users": [
    {
      "user_id": 2,
      "username": "john",
      "bytes_in": 536870912,
      "bytes_out": 268435456,
      "total": 805306368
    }
  ]
}
```

### Faol tunnellar

```
GET /api/tunnels/active
```

**Javob:**

```json
[
  {
    "subdomain": "myapp",
    "protocol": "http",
    "user_id": 2,
    "username": "john",
    "token_id": 3,
    "connected_at": "2024-01-20 14:30:00",
    "bytes_in": 1048576,
    "bytes_out": 2097152
  },
  {
    "port": 5432,
    "protocol": "tcp",
    "user_id": 2,
    "username": "john",
    "token_id": 3,
    "connected_at": "2024-01-20 14:35:00",
    "bytes_in": 512000,
    "bytes_out": 1024000
  }
]
```

### Trafik analitikasi

```
GET /api/analytics/traffic?user_id=2&days=30
```

**Parametrlar:**

| Parametr | Tur | Standart | Tavsif |
|----------|-----|----------|--------|
| `user_id` | int | | Foydalanuvchi ID (ko'rsatilmasa tizim miqyosida) |
| `days` | int | `30` | Kunlar soni |

**Javob (foydalanuvchi bo'yicha):**

```json
[
  {
    "user_id": 2,
    "date": "2024-01-19",
    "bytes_in": 536870912,
    "bytes_out": 268435456,
    "total": 805306368
  },
  {
    "user_id": 2,
    "date": "2024-01-20",
    "bytes_in": 268435456,
    "bytes_out": 134217728,
    "total": 402653184
  }
]
```

**Javob (tizim miqyosida -- `user_id` ko'rsatilmasa):**

```json
[
  {
    "user_id": 2,
    "username": "john",
    "bytes_in": 1073741824,
    "bytes_out": 536870912,
    "total": 1610612736
  }
]
```

## Foydalanuvchilar

### Foydalanuvchilar ro'yxati

```
GET /api/users
```

**Javob:**

```json
[
  {
    "id": 1,
    "username": "admin",
    "role": "admin",
    "enabled": true,
    "max_tunnels": 0,
    "allowed_protocols": "http,tcp",
    "traffic_limit": 0,
    "traffic_period": "monthly",
    "max_devices": 0,
    "skip_warning": true,
    "can_use_proxy": true,
    "created_at": "2024-01-15T10:30:00Z",
    "updated_at": "2024-01-15T10:30:00Z"
  }
]
```

### Foydalanuvchi tafsilotlari

```
GET /api/users/:id
```

**Javob:**

```json
{
  "user": {
    "id": 2,
    "username": "john",
    "role": "user",
    "enabled": true,
    "max_tunnels": 5,
    "allowed_protocols": "http,tcp",
    "traffic_limit": 10737418240,
    "traffic_period": "monthly",
    "max_devices": 3,
    "skip_warning": false,
    "can_use_proxy": true
  },
  "traffic_used": 805306368,
  "active_tokens": 2
}
```

### Foydalanuvchi yaratish

```
POST /api/users
```

**So'rov tanasi:**

```json
{
  "username": "john",
  "password": "secret123",
  "role": "user",
  "max_tunnels": 5,
  "allowed_protocols": "http,tcp",
  "traffic_limit": 10737418240,
  "traffic_period": "monthly",
  "max_devices": 3,
  "skip_warning": false,
  "can_use_proxy": true
}
```

**Majburiy maydonlar:** `username`, `password`

**Standart qiymatlar:**
- `role`: `"user"`
- `allowed_protocols`: `"http,tcp"`
- `traffic_period`: `"monthly"`

**Muvaffaqiyatli javob:** `201 Created`

### Foydalanuvchini yangilash

```
PUT /api/users/:id
```

**So'rov tanasi** (faqat o'zgartiriladigan maydonlar):

```json
{
  "max_tunnels": 10,
  "enabled": false,
  "password": "newpassword"
}
```

### Foydalanuvchini o'chirish

```
DELETE /api/users/:id
```

**Javob:**

```json
{"status": "deleted"}
```

## Tokenlar

### Foydalanuvchi tokenlari

```
GET /api/users/:id/tokens
```

**Javob:**

```json
[
  {
    "id": 3,
    "user_id": 2,
    "device_name": "laptop",
    "enabled": true,
    "created_at": "2024-01-16T09:00:00Z",
    "last_used": "2024-01-20T12:15:00Z"
  }
]
```

### Token yaratish

```
POST /api/users/:id/tokens
```

**So'rov tanasi:**

```json
{
  "device_name": "laptop"
}
```

**Javob (201):**

```json
{
  "token": "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6",
  "token_id": 5,
  "message": "Save this token — it will only be shown once."
}
```

::: warning Muhim
Token qiymati faqat shu javobda ko'rsatiladi. Saqlang, chunki uni qayta olish imkonsiz.
:::

### Tokenni bekor qilish

```
DELETE /api/tokens/:id
```

**Javob:**

```json
{"status": "revoked"}
```

## Band qilingan subdomenlar

### Subdomenlar ro'yxati

```
GET /api/domains
```

**Javob:**

```json
[
  {
    "id": 1,
    "subdomain": "myapp",
    "user_id": 2,
    "username": "john",
    "created_at": "2024-01-16T10:00:00Z"
  }
]
```

### Subdomen band qilish

```
POST /api/domains
```

**So'rov tanasi:**

```json
{
  "subdomain": "myapp",
  "user_id": 2
}
```

**Muvaffaqiyatli javob (201):**

```json
{
  "subdomain": "myapp",
  "user_id": 2,
  "username": "john"
}
```

### Subdomen bo'shatish

```
DELETE /api/domains/:id
```

**Javob:**

```json
{"status": "removed"}
```

## Xato javoblari

Barcha xato javoblari quyidagi formatda qaytariladi:

```json
{
  "error": "Xato tavsifi"
}
```

### Umumiy xato kodlari

| HTTP kodi | Tavsif |
|-----------|--------|
| `400` | Noto'g'ri so'rov (majburiy maydon yo'q, noto'g'ri format) |
| `401` | Autentifikatsiya talab qilinadi yoki sessiya muddati o'tgan |
| `403` | Ruxsat yo'q (foydalanuvchi admin emas) |
| `404` | Resurs topilmadi |
| `405` | Usul ruxsat etilmagan |
| `500` | Ichki server xatosi |
