# Xato sahifalari

Unne Server turli vaziyatlarda foydalanuvchilarga stilizatsiya qilingan HTML xato sahifalarini ko'rsatadi.

## Sahifa turlari

### Ogohlantirish sahifasi (Warning)

**HTTP holat kodi:** 200

Birinchi marta tunnel subdomeniga tashrif buyurgan brauzer foydalanuvchilariga ko'rsatiladi. Sahifada foydalanuvchi tunnel orqali ochilgan xizmatga kirayotganligini tasdiqlashi so'raladi.

**Qachon ko'rsatiladi:**
- Brauzer so'rovi (User-Agent mavjud va brauzerga o'xshash)
- `unne_confirmed_<subdomain>` cookie mavjud emas
- Tunnel uchun `skip_warning` o'chirilgan
- `X-Unne-Skip-Warning` sarlavhasi mavjud emas

**Qachon o'tkazib yuboriladi:**
- Brauzer bo'lmagan so'rovlar (bo'sh User-Agent)
- Foydalanuvchi allaqachon tasdiqlagan (cookie mavjud)
- Tunnel `skip_warning: true` bilan yaratilgan
- `X-Unne-Skip-Warning` sarlavhasi mavjud

### Topilmadi sahifasi (404 Not Found)

**HTTP holat kodi:** 404

So'ralgan subdomenga mos tunnel topilmaganda ko'rsatiladi.

**Sabablari:**
- Subdomen noto'g'ri
- Tunnel hali yaratilmagan
- Tunnel allaqachon uzilgan

### Oflayn sahifasi (502 Bad Gateway)

**HTTP holat kodi:** 502

Tunnel topilgan, ammo so'rovni mahalliy xizmatga yo'naltirish imkonsiz bo'lganda ko'rsatiladi.

**Sabablari:**
- Mijoz tomonida mahalliy xizmat ishlamayapti
- yamux sessiyasi buzilgan
- Tarmoq muammolari

### Umumiy xato sahifasi

**HTTP holat kodi:** o'zgaruvchan

Boshqa xatolar uchun umumiy xato sahifasi. Xato kodi va tavsifi ko'rsatiladi.

## Sahifa ma'lumotlari

Har bir xato sahifasida quyidagi ma'lumotlar ko'rsatiladi:

| Maydon | Tavsif |
|--------|--------|
| `Subdomain` | So'ralgan subdomen |
| `Domain` | Server domeni |
| `RequestID` | Noyob so'rov identifikatori (24 belgili hex) |
| `ErrorCode` | Xato kodi (agar mavjud bo'lsa) |
| `ErrorMessage` | Xato tavsifi (agar mavjud bo'lsa) |

## Ogohlantirish sahifasini boshqarish

### Foydalanuvchi darajasida

Administrator har bir foydalanuvchi uchun ogohlantirish sahifasini o'tkazib yuborish ruxsatini berishi mumkin:

```bash
curl -X PUT http://localhost:4041/api/users/2 \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{"skip_warning": true}'
```

### Mijoz darajasida

Foydalanuvchiga ruxsat berilgan bo'lsa, mijoz `--skip-warning` parametri yoki `skip_warning: true` konfiguratsiyasi orqali ogohlantirish sahifasini o'tkazib yuborishi mumkin.

### API so'rovlari uchun

API so'rovlarida `X-Unne-Skip-Warning` sarlavhasini qo'shish orqali ogohlantirish sahifasini o'tkazib yuborish mumkin:

```bash
curl -H "X-Unne-Skip-Warning: 1" https://myapp.tunnel.example.com/api/data
```

## Sahifalarni sozlash

Xato sahifalari serverga o'rnatilgan (embedded) HTML shablonlari va CSS fayllaridan iborat:

```
internal/server/pages/
  warning.html     # Ogohlantirish sahifasi
  not_found.html   # 404 sahifasi
  offline.html     # 502 sahifasi
  error.html       # Umumiy xato sahifasi
  base.css         # Umumiy stillar
```

Bu fayllar kompilyatsiya vaqtida binary ichiga o'rnatiladi (`go:embed`). Shablonlarni o'zgartirish uchun manba kodini tahrirlash va qayta kompilyatsiya qilish kerak.
