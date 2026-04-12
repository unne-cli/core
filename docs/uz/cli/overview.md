# Unne CLI haqida umumiy ma'lumot

Unne CLI (`unne`) -- bu mahalliy xizmatlarni Unne Server orqali internetga ochish uchun ishlatiladigan mijoz ilovasi. U HTTP va TCP tunnellarni yaratish, TUI boshqaruv paneli va web inspektor imkoniyatlarini taqdim etadi.

## Buyruqlar

| Buyruq | Tavsif |
|--------|--------|
| `unne setup` | Dastlabki mijoz konfiguratsiyasi (server, port, token) |
| `unne http <port>` | Tezkor HTTP tunnel yaratish |
| `unne tcp <port>` | Tezkor TCP tunnel yaratish |
| `unne start` | `unne.yml` faylidan tunnellarni ishga tushirish |
| `unne start --all` | Konfiguratsiyadan barcha tunnellarni ishga tushirish |
| `unne check` | Serverga ulanishni tekshirish |
| `unne domains` | Sizning band qilingan subdomenlaringiz ro'yxati |
| `unne version` | Versiyani ko'rsatish |

## Umumiy parametrlar

| Parametr | Qisqartma | Tavsif |
|----------|-----------|--------|
| `--config` | `-c` | Konfiguratsiya fayl yo'li (standart: `unne.yml`) |
| `--subdomain` | `-s` | Istalgan subdomen (faqat HTTP) |
| `--remote-port` | `-rp` | Masofaviy port (faqat TCP) |
| `--proxy` | `-p` | Proksi URL (`socks5://` yoki `http://`) |
| `--skip-warning` | `--sw` | Brauzer ogohlantirish sahifasini o'tkazib yuborish |
| `--no-tui` | | TUI ni o'chirish, faqat log rejimi |
| `--webui` | `-w` | Web inspektorni yoqish |
| `--webui-port` | `-wp` | Web inspektor porti (standart: `4040`) |

## Tezkor foydalanish

```bash
# Mijozni sozlash
unne setup

# HTTP tunnel (mahalliy 3000-portni ochish)
unne http 3000

# Maxsus subdomen bilan HTTP tunnel
unne http 3000 --subdomain myapp

# TCP tunnel
unne tcp 5432 --remote-port 5432

# Proksi orqali ulanish
unne http 3000 --proxy socks5://127.0.0.1:1080

# Web inspektor bilan
unne http 3000 --webui

# unne.yml dan tunnellarni ishga tushirish
unne start
```

## Konfiguratsiya fayllari

Unne CLI ikki darajali konfiguratsiya tizimidan foydalanadi:

1. **Global sozlamalar** (`~/.unne/settings.yml`) -- `unne setup` orqali yaratiladi
2. **Loyiha konfiguratsiyasi** (`unne.yml`) -- loyiha papkasida joylashadi

Loyiha konfiguratsiyasi global sozlamalardan ustun turadi. Batafsil ma'lumot uchun [Konfiguratsiya](/uz/cli/configuration) sahifasiga qarang.

## Tunnel holatlari

Tunnel ulanish jarayonida quyidagi holatlardan o'tadi:

| Holat | Tavsif |
|-------|--------|
| `connecting` | Serverga ulanish o'rnatilmoqda |
| `connected` | Tunnel faol, trafik yo'naltirilmoqda |
| `disconnected` | Ulanish uzildi, qayta ulanish kutilmoqda |
| `error` | Xatolik yuz berdi (masalan, autentifikatsiya xatosi) |

Ulanish uzilganda Unne CLI avtomatik ravishda 3 soniyadan keyin qayta ulanadi. Handshake xatoliklari (masalan, noto'g'ri token) qayta ulanishga urinmasdan to'xtatiladi.
