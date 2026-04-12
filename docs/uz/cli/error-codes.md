# Xato kodlari

Unne handshake jarayonida server tomonidan qaytariladigan xato kodlari va ularning tavsifi.

## Xato kodlari jadvali

| Kod | Tavsif | Yechim |
|-----|--------|--------|
| `STATUS_UNNE_AUTH_FAILED` | Noto'g'ri yoki muddati o'tgan autentifikatsiya tokeni | Tokeningizni tekshiring. Yangi token olish uchun administratorga murojaat qiling. |
| `STATUS_UNNE_SUBDOMAIN_TAKEN` | Subdomen allaqachon ishlatilmoqda | Boshqa subdomen tanlang yoki subdomenni band qildiring. |
| `STATUS_UNNE_PROTOCOL_ERROR` | Handshake protokol xatosi | CLI versiyangizni yangilang. Server va mijoz versiyalari mos kelishini tekshiring. |
| `STATUS_UNNE_TUNNEL_LIMIT` | Hisobingiz uchun maksimal tunnel limiti yetildi | Foydalanilmayotgan tunnellarni yoping yoki administratordan limitni oshirishni so'rang. |
| `STATUS_UNNE_PROTOCOL_DENIED` | Hisobingiz ushbu protokoldan foydalanishga ruxsat etilmagan | Administrator hisobingiz uchun ushbu protokolni yoqishi kerak. |
| `STATUS_UNNE_TRAFFIC_EXCEEDED` | Joriy davr uchun trafik limiti oshib ketdi | Keyingi davr boshlanishini kuting yoki administratordan limitni oshirishni so'rang. |
| `STATUS_UNNE_DEVICE_LIMIT` | Hisobingiz uchun maksimal qurilma limiti yetildi | Boshqa qurilmalardagi tunnellarni yoping yoki administratordan limitni oshirishni so'rang. |
| `STATUS_UNNE_USER_DISABLED` | Hisobingiz o'chirilgan | Administratorga murojaat qiling. |
| `STATUS_UNNE_TOKEN_DISABLED` | Token bekor qilingan yoki o'chirilgan | Yangi token yarating yoki administratorga murojaat qiling. |
| `STATUS_UNNE_PORT_UNAVAILABLE` | So'ralgan port mavjud emas | Boshqa port tanlang. Port boshqa tunnel yoki tizim xizmati tomonidan ishlatilayotgan bo'lishi mumkin. |
| `STATUS_UNNE_SERVER_ERROR` | Ichki server xatosi | Keyinroq qayta urinib ko'ring. Muammo davom etsa, server loglarini tekshiring. |

## Xato turlari

### Qayta ulanadigan xatolar

Quyidagi xatolar yuz berganda Unne CLI 3 soniyadan keyin avtomatik qayta ulanadi:

- Tarmoq ulanishi uzilishi
- Server vaqtincha mavjud emas
- yamux sessiya xatosi

### Tug'ri xatolar (qayta ulanish bo'lmaydi)

Quyidagi handshake xatolari qayta ulanishga urinmasdan dasturni to'xtatadi:

- `STATUS_UNNE_AUTH_FAILED`
- `STATUS_UNNE_PROTOCOL_DENIED`
- `STATUS_UNNE_USER_DISABLED`
- `STATUS_UNNE_TOKEN_DISABLED`
- `STATUS_UNNE_SUBDOMAIN_TAKEN` (maxsus subdomen so'ralganda)
- `STATUS_UNNE_TRAFFIC_EXCEEDED`

## Eski xato kodlari (v1)

V1 handshake protokolidagi eski kodlar hali ham qo'llab-quvvatlanadi:

| Eski kod | Yangi ekvivalent |
|----------|------------------|
| `UNNE_ERR_403` | `STATUS_UNNE_AUTH_FAILED` |
| `UNNE_ERR_102` | `STATUS_UNNE_SUBDOMAIN_TAKEN` |
| `UNNE_ERR_101` | `STATUS_UNNE_PROTOCOL_ERROR` |

## Xatolarni tuzatish

### Ulanish muammolari

```bash
# Server ulanishini tekshirish
unne check

# Natija (muvaffaqiyatli):
# Checking tunnel.example.com:8222...
# Server is reachable!

# Natija (muvaffaqiyatsiz):
# Error: dial tcp: connect: connection refused
```

### Token muammolari

Agar `STATUS_UNNE_AUTH_FAILED` xatosi olsangiz:

1. Tokeningiz to'g'ri kiritilganligini tekshiring
2. Token bekor qilinmagan yoki o'chirilmaganligini tekshiring
3. Yangi token yaratish uchun administratorga murojaat qiling
4. `unne setup` buyrug'i orqali tokenni qayta kiriting

### Limit muammolari

Agar `STATUS_UNNE_TUNNEL_LIMIT` yoki `STATUS_UNNE_DEVICE_LIMIT` olsangiz:

1. Boshqa qurilmalardagi faol tunnellarni yoping
2. Foydalanilmayotgan tunnellarni to'xtating
3. Administratordan limitlarni oshirishni so'rang
