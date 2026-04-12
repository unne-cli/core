# Unne nima?

Unne -- bu mahalliy xizmatlarni o'z serveringiz orqali internetga ochish imkonini beruvchi self-hosted tunneling yechimi. Uni ngrok, Cloudflare Tunnel yoki localtunnel ning o'z-o'zingiz joylashtiriladigan muqobili deb tasavvur qiling.

## Komponentlar

Unne ikki qismdan iborat:

| Komponent | Tavsif |
|-----------|--------|
| **Unne CLI** (`unne`) | Kompyuteringizda ishlaydigan va tunnellar yaratadigan mijoz ilovasi |
| **Unne Server** (`unns`) | Tunnel ulanishlarni qabul qiladigan va trafikni yo'naltiruvchi server ilovasi |

## Qanday ishlaydi

```
Internet → Unne Server (sizning VPS) → Yamux Multiplexing → Unne CLI → Mahalliy xizmat
                                ↑
                    subdomain.yourdomain.com
```

1. VPS serveringizda umumiy IP va domen bilan `unns` ishga tushirasiz
2. `*.yourdomain.com` uchun DNS serveringizga yo'naltiriladi
3. Mahalliy kompyuteringizda `unne http 3000` buyrug'ini ishga tushirasiz
4. Unne CLI serverga ulanadi, multiplekslangan tunnel o'rnatadi
5. Mahalliy xizmatingiz endi `https://random.yourdomain.com` manzilida ochiq

## Asosiy imkoniyatlar

- **HTTP tunnellar** maxsus yoki avtomatik yaratilgan subdomenlar bilan
- **TCP tunnellar** ma'lumotlar bazalari, SSH va boshqa protokollar uchun
- **TUI boshqaruv paneli** mitmproxy uslubidagi so'rovlar inspektori bilan
- **Web inspektor** Chrome DevTools Network konsoli uslubida
- **Foydalanuvchilarni boshqarish** har bir foydalanuvchi uchun limitlar va kvotalar bilan
- **Admin panel** serverni boshqarish uchun
- **Proksi qo'llab-quvvatlash** (SOCKS5, HTTP CONNECT)
- **Ogohlantirish sahifalari** birinchi marta tashrif buyuruvchilar uchun (sozlanishi mumkin)

## Protokol

Unne bitta TCP ulanish orqali bir nechta oqimlarni multiplekslash uchun [yamux](https://github.com/hashicorp/yamux) dan foydalanadi. Bu mijoz va server o'rtasida bir nechta portlarni ochmasdan samarali ikki tomonlama aloqani ta'minlaydi.

## Xavfsizlik

- Tokenlar SHA-256 xesh sifatida saqlanadi (hech qachon ochiq matnda emas)
- Admin parollari bcrypt dan foydalanadi
- Har bir foydalanuvchi uchun protokol cheklovlari va trafik limitlari
- Birinchi marta tashrif buyuruvchilar uchun brauzer ogohlantirish sahifalari
- Sessiyaga asoslangan admin autentifikatsiyasi
