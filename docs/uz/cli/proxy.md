# Proksi qo'llab-quvvatlash

Unne CLI serverga ulanishda SOCKS5 va HTTP CONNECT proksilardan foydalanishni qo'llab-quvvatlaydi. Bu cheklangan tarmoqlarda yoki korporativ faervol ortida ishlashda foydalidir.

## Qo'llab-quvvatlanadigan proksi turlari

| Tur | URL formati | Tavsif |
|-----|-------------|--------|
| SOCKS5 | `socks5://host:port` | SOCKS5 proksi |
| HTTP CONNECT | `http://host:port` | HTTP CONNECT tunnel proksi |

## Foydalanish

### Buyruq qatori orqali

```bash
# SOCKS5 proksi
unne http 3000 --proxy socks5://127.0.0.1:1080

# HTTP proksi
unne http 3000 --proxy http://proxy.example.com:8080

# Autentifikatsiya bilan
unne http 3000 --proxy socks5://user:pass@127.0.0.1:1080
```

### Konfiguratsiya fayli orqali

Global sozlamalarda (`~/.unne/settings.yml`):

```yaml
proxy:
  url: socks5://127.0.0.1:1080
```

Loyiha konfiguratsiyasida (`unne.yml`):

```yaml
proxy:
  url: socks5://127.0.0.1:1080

tunnels:
  - name: frontend
    protocol: http
    upstream: localhost:3000
```

Har bir tunnel uchun alohida proksi:

```yaml
tunnels:
  - name: frontend
    protocol: http
    upstream: localhost:3000
    proxy:
      url: socks5://127.0.0.1:1080

  - name: api
    protocol: http
    upstream: localhost:8080
    # Bu tunnel proksisiz ulanadi
```

## SOCKS5 proksi

SOCKS5 proksi TCP darajasida ishlaydi va barcha turdagi trafikni yo'naltirishi mumkin.

```bash
# Oddiy SOCKS5
unne http 3000 --proxy socks5://127.0.0.1:1080

# Foydalanuvchi nomi va parol bilan
unne http 3000 --proxy socks5://username:password@127.0.0.1:1080
```

Mashhur SOCKS5 proksilar:
- **SSH tunnel**: `ssh -D 1080 user@server`
- **Tor**: `socks5://127.0.0.1:9050`

## HTTP CONNECT proksi

HTTP CONNECT usuli ko'plab korporativ proksilarda qo'llab-quvvatlanadi.

```bash
# Oddiy HTTP proksi
unne http 3000 --proxy http://proxy.company.com:8080

# Autentifikatsiya bilan (Basic Auth)
unne http 3000 --proxy http://user:pass@proxy.company.com:8080
```

HTTP proksi ishlash jarayoni:
1. Proksi serverga TCP ulanish o'rnatiladi
2. `CONNECT host:port HTTP/1.1` so'rovi yuboriladi
3. Proksi autentifikatsiyani tekshiradi (agar kerak bo'lsa)
4. Proksi `200` javob qaytaradi
5. Endi TCP ulanish to'g'ridan-to'g'ri Unne Serverga yo'naltiriladi

## Ustuvorlik tartibi

Proksi sozlamalari quyidagi tartibda qo'llaniladi:

1. **Buyruq qatori** (`--proxy`) -- eng yuqori ustuvorlik
2. **Tunnel proksi** (`tunnels[].proxy`) -- tunnel darajasida
3. **Loyiha proksi** (`proxy` in `unne.yml`) -- loyiha darajasida
4. **Global proksi** (`proxy` in `settings.yml`) -- eng past ustuvorlik

## Foydalanuvchi ruxsati

Server administratori har bir foydalanuvchi uchun proksi ishlatish ruxsatini boshqarishi mumkin. Agar sizning hisobingizda proksi ishlatish cheklangan bo'lsa, proksi sozlamalari e'tiborga olinmaydi.
