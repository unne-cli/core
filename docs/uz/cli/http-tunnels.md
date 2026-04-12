# HTTP tunnellar

HTTP tunnellar mahalliy veb-xizmatlarni subdomen orqali internetga ochish imkonini beradi.

## Tezkor foydalanish

```bash
# Tasodifiy subdomen bilan
unne http 3000

# Maxsus subdomen bilan
unne http 3000 --subdomain myapp
```

Natija:

```
[quick] Connected: https://myapp.tunnel.example.com -> localhost:3000
```

## Subdomenlar

### Tasodifiy subdomen

Agar subdomen ko'rsatilmasa, server avtomatik ravishda 8 belgili tasodifiy subdomen yaratadi:

```bash
unne http 3000
# Natija: https://a1b2c3d4.tunnel.example.com
```

### Maxsus subdomen

Buyruq qatori orqali:

```bash
unne http 3000 --subdomain myapp
# yoki
unne http 3000 -s myapp
```

`unne.yml` orqali:

```yaml
tunnels:
  - name: frontend
    protocol: http
    subdomain: myapp
    upstream: localhost:3000
```

::: tip Band qilingan subdomenlar
Administrator sizning hisobingiz uchun subdomenlarni band qilishi mumkin. Band qilingan subdomen faqat sizning tokeningiz bilan ishlatilishi mumkin. Subdomenlaringizni ko'rish uchun `unne domains` buyrug'ini ishlating.
:::

### Subdomen to'qnashuvi

Agar so'ralgan subdomen allaqachon faol tunnel tomonidan ishlatilayotgan bo'lsa, server `STATUS_UNNE_SUBDOMAIN_TAKEN` xatosini qaytaradi. Tasodifiy subdomen bilan ulanayotganda to'qnashuv avtomatik hal qilinadi.

## Bir nechta HTTP tunnellar

`unne.yml` fayli orqali bir nechta tunnellarni bir vaqtda ishga tushirishingiz mumkin:

```yaml
tunnels:
  - name: frontend
    protocol: http
    subdomain: app
    upstream: localhost:3000

  - name: api
    protocol: http
    subdomain: api
    upstream: localhost:8080

  - name: docs
    protocol: http
    upstream: localhost:4000
```

```bash
unne start
```

TUI boshqaruv panelida har bir tunnel alohida tab sifatida ko'rinadi.

## So'rov jarayoni

HTTP so'rov quyidagi bosqichlardan o'tadi:

1. Brauzer `https://myapp.tunnel.example.com` ga so'rov yuboradi
2. Server `Host` sarlavhasidan `myapp` subdomenini ajratadi
3. Server mos yamux sessiyasini topadi
4. Yangi yamux oqimi ochiladi
5. So'rov oqim orqali mijozga yo'naltiriladi
6. Mijoz so'rovni `localhost:3000` ga yo'naltiradi
7. Javob xuddi shu yo'l orqali qaytadi

## Ogohlantirish sahifasi

Standart holatda, birinchi marta subdomenga tashrif buyurgan brauzer foydalanuvchilariga ogohlantirish sahifasi ko'rsatiladi. Bu xavfsizlik chorasi bo'lib, tashrif buyuruvchilarni ular tunnel orqali ochilgan xizmatga kirayotganligi haqida xabardor qiladi.

Ogohlantirish sahifasini o'tkazib yuborish usullari:

```bash
# Buyruq qatori orqali
unne http 3000 --skip-warning

# unne.yml orqali
skip_warning: true
```

::: warning Eslatma
`skip_warning` faqat administrator tomonidan foydalanuvchi sozlamalarida ruxsat berilgan bo'lsa ishlaydi.
:::

API so'rovlari uchun `X-Unne-Skip-Warning` sarlavhasini qo'shish orqali ogohlantirish sahifasini o'tkazib yuborish mumkin. Brauzer bo'lmagan so'rovlar (bo'sh User-Agent) avtomatik ravishda o'tkazib yuboriladi.

## Trafik kuzatuvi

Barcha HTTP so'rovlari TUI boshqaruv paneli va web inspektorda ko'rinadi:

- So'rov usuli (GET, POST, va h.k.)
- URL yo'li
- Javob status kodi
- So'rov davomiyligi
- So'rov va javob sarlavhalari
- So'rov va javob tanasi
