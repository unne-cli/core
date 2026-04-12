# TUI boshqaruv paneli

Unne CLI o'rnatilgan terminal foydalanuvchi interfeysi (TUI) bilan birga keladi. U [BubbleTea](https://github.com/charmbracelet/bubbletea) kutubxonasi asosida qurilgan bo'lib, mitmproxy uslubida so'rovlarni kuzatish va tunnel holatini ko'rish imkonini beradi.

## Ishga tushirish

TUI standart holatda yoqilgan. Har qanday tunnel buyrug'i TUI ni ishga tushiradi:

```bash
unne http 3000
unne start
```

TUI ni o'chirish:

```bash
unne http 3000 --no-tui
```

Yoki `unne.yml` da:

```yaml
gui:
  tui: false
```

## Interfeys tuzilishi

```
UNNE TUNNEL v2.0.0                              ● ONLINE  https://myapp.tunnel.example.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
● frontend (12)  ○ api (5)  ○ database
────────────────────────��────────────────────────────────────────────────────────
  15:04:05  GET    /api/users         200  12ms
  15:04:06  POST   /api/login         201  45ms
  15:04:07  GET    /static/app.js     200   3ms
  ...

↑↓ navigate  enter details  esc back  v split  tab/shift+tab switch  q quit
```

### Sarlavha

- Tunnel nomi va versiyasi
- Ulanish holati: `ONLINE`, `CONNECTING...`, `OFFLINE`, `ERROR`
- Ommaviy URL manzili

### Tablar

Bir nechta tunnel ishlatganda, har bir tunnel alohida tab sifatida ko'rinadi:
- `●` -- ulangan
- `◌` -- ulanmoqda
- `○` -- uzilgan
- Qavslar ichida so'rovlar soni

### So'rovlar ro'yxati

HTTP tunnellar uchun:
- Vaqt belgisi
- HTTP usuli (GET, POST, PUT, DELETE, va h.k.)
- URL yo'li
- Javob status kodi
- So'rov davomiyligi

TCP tunnellar uchun:
- Vaqt belgisi
- Mijoz IP manzili
- Yuborilgan/qabul qilingan baytlar
- Ulanish davomiyligi

### So'rov tafsilotlari

So'rovni tanlab `Enter` tugmasini bosganingizda batafsil ma'lumotlar ko'rsatiladi:
- So'rov sarlavhalari
- Javob sarlavhalari
- So'rov tanasi
- Javob tanasi

## Klaviatura tugmalari

| Tugma | Amal |
|-------|------|
| `↑` / `↓` | So'rovlar ro'yxatida yuqoriga/pastga |
| `Enter` | Tanlangan so'rovning tafsilotlarini ko'rish |
| `Esc` | Tafsilotlardan ro'yxatga qaytish |
| `v` | Bo'lingan ko'rinishni yoqish/o'chirish |
| `Tab` | Keyingi tunnelga o'tish |
| `Shift+Tab` | Oldingi tunnelga o'tish |
| `q` | Dasturdan chiqish |

## Bo'lingan ko'rinish

`v` tugmasini bosib bo'lingan ko'rinishni yoqishingiz mumkin. Bu holatda ekranning chap tomonida so'rovlar ro'yxati, o'ng tomonida esa tanlangan so'rovning tafsilotlari ko'rsatiladi.

## Bosh rejim (Headless)

TUI o'chirilganda (`--no-tui`), Unne CLI oddiy log formatida ishlaydi:

```
[quick] Connected: https://myapp.tunnel.example.com -> localhost:3000
[15:04:05] quick GET /api/users 200 12ms
[15:04:06] quick POST /api/login 201 45ms
```

TCP tunnellar uchun:

```
[15:04:05] quick TCP 192.168.1.1 sent=1024 recv=2048 350ms
```
