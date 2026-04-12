# Foydalanuvchilarni boshqarish

Unne Server foydalanuvchilarga asoslangan autentifikatsiya tizimidan foydalanadi. Har bir foydalanuvchining o'z tokenlari, limitlari va ruxsatlari bor.

## Foydalanuvchi yaratish

### CLI orqali

```bash
# Oddiy foydalanuvchi
unns user create john secret123

# Admin foydalanuvchi
unns user create admin supersecret admin
```

Natija:

```
User 'john' created (ID: 2, role: user)
```

### Admin panel orqali

Admin panelda **Users** bo'limiga o'ting va **Create User** tugmasini bosing.

### Admin API orqali

```bash
curl -X POST http://localhost:4041/api/users \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{
    "username": "john",
    "password": "secret123",
    "role": "user",
    "max_tunnels": 5,
    "allowed_protocols": "http,tcp",
    "traffic_limit": 10737418240,
    "traffic_period": "monthly",
    "max_devices": 3
  }'
```

## Foydalanuvchilar ro'yxati

```bash
unns user list
```

Natija:

```
ID    Username             Role     Status   Max Tunnels  Max Devices
---------------------------------------------------------------------------
1     admin                admin    enabled  unlimited    unlimited
2     john                 user     enabled  5            3
3     jane                 user     disabled unlimited    unlimited
```

## Foydalanuvchi sozlamalari

| Maydon | Tur | Standart | Tavsif |
|--------|-----|----------|--------|
| `username` | string | | Foydalanuvchi nomi (noyob) |
| `password_hash` | string | | bcrypt bilan xeshlangan parol |
| `role` | string | `"user"` | Rol: `user` yoki `admin` |
| `enabled` | bool | `true` | Hisob faolmi |
| `max_tunnels` | int | `0` (cheksiz) | Maksimal bir vaqtdagi tunnel soni |
| `allowed_protocols` | string | `"http,tcp"` | Ruxsat etilgan protokollar |
| `traffic_limit` | int64 | `0` (cheksiz) | Trafik limiti (baytlarda) |
| `traffic_period` | string | `"monthly"` | Trafik davri: `daily`, `monthly`, `quarterly` |
| `max_devices` | int | `0` (cheksiz) | Maksimal qurilmalar soni (faol tokenlar) |
| `skip_warning` | bool | `false` | Ogohlantirish sahifasini o'tkazib yuborishga ruxsat |
| `can_use_proxy` | bool | `true` | Proksi ishlatishga ruxsat |

## Foydalanuvchini yangilash

Admin API orqali:

```bash
curl -X PUT http://localhost:4041/api/users/2 \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{
    "max_tunnels": 10,
    "traffic_limit": 21474836480,
    "enabled": true
  }'
```

Faqat ko'rsatilgan maydonlar yangilanadi -- boshqa qiymatlar o'zgarmaydi.

## Foydalanuvchini o'chirish

```bash
unns user delete 2
```

::: warning Ogohlantirish
Foydalanuvchini o'chirish uning barcha tokenlarini va band qilingan subdomenlarini ham o'chiradi (CASCADE). Faol tunnellar darhol uzilmaydi, lekin qayta ulanish imkonsiz bo'ladi.
:::

## Rollar

| Rol | Tavsif |
|-----|--------|
| `user` | Oddiy foydalanuvchi -- faqat tunnel yaratishi mumkin |
| `admin` | Administrator -- admin panelga kirishi mumkin, foydalanuvchilar va tokenlarni boshqarishi mumkin |

Admin roli faqat admin panelga kirish uchun kerak. Tunnel yaratish uchun har qanday faol foydalanuvchi tokeni ishlatilishi mumkin.

## Parolni o'zgartirish

Admin API orqali:

```bash
curl -X PUT http://localhost:4041/api/users/2 \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{"password": "newpassword123"}'
```
