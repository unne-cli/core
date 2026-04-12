# Unne Server haqida umumiy ma'lumot

Unne Server (`unns`) -- bu tunnel ulanishlarni qabul qilib, trafikni yo'naltiruvchi server ilovasi. U VPS yoki ixtiyoriy umumiy IP manzilli serverda ishga tushiriladi.

## Komponentlar

Unne Server quyidagi komponentlardan iborat:

| Komponent | Port | Tavsif |
|-----------|------|--------|
| **Boshqaruv tekisligi** | `8222` (standart) | Mijoz handshake va yamux ulanishlarni boshqaradi |
| **HTTP proksi** | `8223` (standart) | HTTP so'rovlarni subdomen bo'yicha yo'naltiradi |
| **Admin panel** | `4041` (standart) | Web asosidagi boshqaruv interfeysi |
| **TCP portlar** | Dinamik | TCP tunnellar uchun ochilgan portlar |

## Buyruqlar

| Buyruq | Tavsif |
|--------|--------|
| `unns` | Serverni ishga tushirish |
| `unns setup` | Interaktiv sozlash ustasi |
| `unns config get <key>` | Konfiguratsiya qiymatini olish |
| `unns config set <key> <value>` | Konfiguratsiya qiymatini o'rnatish |
| `unns config list` | Barcha konfiguratsiya qiymatlarini ko'rsatish |
| `unns user create <username> <password> [role]` | Foydalanuvchi yaratish |
| `unns user list` | Foydalanuvchilar ro'yxati |
| `unns user delete <user_id>` | Foydalanuvchini o'chirish |
| `unns token gen <user_id> [device_name]` | Token yaratish |
| `unns token list [user_id]` | Tokenlar ro'yxati |
| `unns token revoke <token_id>` | Tokenni bekor qilish |

## Ma'lumotlar saqlash

| Komponent | Joylashuv | Tavsif |
|-----------|-----------|--------|
| Konfiguratsiya | `/etc/unne/config.yml` | Server konfiguratsiyasi |
| Ma'lumotlar bazasi | `/etc/unne/unne.db` | SQLite ma'lumotlar bazasi |
| Loglar | `/var/log/unne/server.log` | Server loglari |

## Ma'lumotlar bazasi sxemasi

Unne Server SQLite ma'lumotlar bazasidan foydalanadi va quyidagi jadvallarni o'z ichiga oladi:

| Jadval | Tavsif |
|--------|--------|
| `users` | Foydalanuvchilar va ularning sozlamalari |
| `tokens` | Autentifikatsiya tokenlari (faqat xeshlar saqlanadi) |
| `traffic_log` | Trafik statistikasi |
| `sessions` | Admin panel sessiyalari |
| `reserved_domains` | Band qilingan subdomenlar |

## Xavfsizlik

- **Tokenlar** SHA-256 xesh sifatida saqlanadi -- ochiq matn hech qachon saqlanmaydi
- **Parollar** bcrypt bilan xeshlanadi
- **Admin sessiyalar** muddatli va cookie asosida
- **Foydalanuvchi limitlari** tunnel, qurilma, trafik va protokol darajasida
- **Ogohlantirish sahifalari** birinchi marta tashrif buyuruvchilar uchun

## Tizim talablari

- Linux (amd64 yoki arm64) tavsiya etiladi
- Umumiy IP manzil
- Wildcard DNS sozlangan domen
- Minimal resurslar: 512MB RAM, 1 CPU yadrosi
