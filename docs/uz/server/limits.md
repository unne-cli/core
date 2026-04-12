# Limitlar va kvotalar

Unne Server har bir foydalanuvchi uchun turli limitlar va kvotalarni o'rnatish imkonini beradi.

## Mavjud limitlar

| Limit | Maydon | Standart | Tavsif |
|-------|--------|----------|--------|
| Tunnel limiti | `max_tunnels` | `0` (cheksiz) | Bir vaqtda faol bo'lishi mumkin bo'lgan tunnellar soni |
| Qurilma limiti | `max_devices` | `0` (cheksiz) | Bir vaqtda faol bo'lishi mumkin bo'lgan qurilmalar (tokenlar) soni |
| Trafik limiti | `traffic_limit` | `0` (cheksiz) | Davr uchun maksimal trafik hajmi (baytlarda) |
| Protokol cheklovi | `allowed_protocols` | `"http,tcp"` | Ruxsat etilgan protokollar |
| Proksi ruxsati | `can_use_proxy` | `true` | Proksi ishlatishga ruxsat |
| Ogohlantirish o'tkazish | `skip_warning` | `false` | Brauzer ogohlantirish sahifasini o'tkazib yuborishga ruxsat |

## Tunnel limiti

Foydalanuvchi bir vaqtda nechta tunnel ochishi mumkinligini belgilaydi.

```bash
# Admin API orqali o'rnatish
curl -X PUT http://localhost:4041/api/users/2 \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{"max_tunnels": 5}'
```

`0` qiymati cheksiz tunnellarni bildiradi.

Limit yetilganda mijoz `STATUS_UNNE_TUNNEL_LIMIT` xatosini oladi.

### Qanday hisoblanadi

Barcha faol HTTP va TCP tunnellar hisobga olinadi. Masalan, agar foydalanuvchi 3 ta HTTP tunnel va 2 ta TCP tunnel ochgan bo'lsa, jami 5 ta tunnel.

## Qurilma limiti

Bir vaqtda nechta turli qurilmadan (token) tunnel yaratish mumkinligini belgilaydi.

```bash
curl -X PUT http://localhost:4041/api/users/2 \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{"max_devices": 3}'
```

Limit yetilganda mijoz `STATUS_UNNE_DEVICE_LIMIT` xatosini oladi.

### Qanday hisoblanadi

Faol tunnellardagi noyob token IDlar hisoblanadi. Bitta token bilan bir nechta tunnel ochish bitta qurilma sifatida hisoblanadi.

## Trafik limiti

Foydalanuvchi ma'lum davr ichida ishlatishi mumkin bo'lgan maksimal trafik hajmini belgilaydi.

```bash
# 10 GB oylik limit
curl -X PUT http://localhost:4041/api/users/2 \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{
    "traffic_limit": 10737418240,
    "traffic_period": "monthly"
  }'
```

### Trafik davrlari

| Davr | Maydon qiymati | Boshlanishi |
|------|----------------|-------------|
| Kunlik | `"daily"` | Har kuni yarim tunda |
| Oylik | `"monthly"` | Har oyning 1-kuni |
| Choraklik | `"quarterly"` | Har chorakning 1-kuni (yanvar, aprel, iyul, oktabr) |

### Qanday hisoblanadi

Kiruvchi va chiquvchi trafik yig'indisi hisoblanadi. Trafik har 30 soniyada ma'lumotlar bazasiga yoziladi.

Limit yetilganda mijoz `STATUS_UNNE_TRAFFIC_EXCEEDED` xatosini oladi.

## Protokol cheklovi

Foydalanuvchi qaysi protokollardan foydalanishi mumkinligini belgilaydi.

```bash
# Faqat HTTP ruxsat etish
curl -X PUT http://localhost:4041/api/users/2 \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{"allowed_protocols": "http"}'

# HTTP va TCP
curl -X PUT http://localhost:4041/api/users/2 \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{"allowed_protocols": "http,tcp"}'
```

Ruxsat etilmagan protokoldan foydalanishga urinilganda mijoz `STATUS_UNNE_PROTOCOL_DENIED` xatosini oladi.

## Limitlar misollar

### Bepul foydalanuvchi

```json
{
  "max_tunnels": 2,
  "max_devices": 1,
  "traffic_limit": 1073741824,
  "traffic_period": "monthly",
  "allowed_protocols": "http",
  "skip_warning": false
}
```

2 tunnel, 1 qurilma, oyiga 1 GB, faqat HTTP.

### Premium foydalanuvchi

```json
{
  "max_tunnels": 20,
  "max_devices": 5,
  "traffic_limit": 107374182400,
  "traffic_period": "monthly",
  "allowed_protocols": "http,tcp",
  "skip_warning": true
}
```

20 tunnel, 5 qurilma, oyiga 100 GB, HTTP va TCP, ogohlantirish o'tkazish yoqilgan.

### Cheksiz foydalanuvchi

```json
{
  "max_tunnels": 0,
  "max_devices": 0,
  "traffic_limit": 0,
  "allowed_protocols": "http,tcp",
  "skip_warning": true
}
```

Barcha qiymatlar `0` -- hech qanday limit yo'q.
