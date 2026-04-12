# Admin panel

Admin panel -- bu Unne Serverni brauzer orqali boshqarish uchun web interfeys. U foydalanuvchilar, tokenlar, tunnellar va trafik statistikasini boshqarish imkonini beradi.

## Yoqish

Admin panel `unns setup` jarayonida yoqiladi. Konfiguratsiya faylida:

```yaml
admin:
  enabled: true
  port: 4041
  session_ttl: 24h
```

Ishga tushirilganda:

```
Admin panel: http://localhost:4041
```

## Kirish

Brauzerda `http://your-server:4041` manzilini oching va admin hisob ma'lumotlari bilan kiring.

Autentifikatsiya sessiyaga asoslangan -- cookie orqali saqlanadi. Sessiya muddati `session_ttl` parametri bilan boshqariladi.

::: tip Xavfsizlik
Admin panelni faqat ichki tarmoq yoki VPN orqali ochishni tavsiya qilamiz. Agar tashqi tarmoqdan kirish kerak bo'lsa, HTTPS va kuchli parol ishlatishni ta'minlang.
:::

## Boshqaruv paneli (Dashboard)

Bosh sahifada quyidagi ma'lumotlar ko'rsatiladi:

- **Jami foydalanuvchilar** -- tizimda ro'yxatdan o'tgan foydalanuvchilar soni
- **Faol tunnellar** -- hozirda ulangan tunnellar soni
- **Bugungi trafik** -- bugungi kun uchun umumiy trafik hajmi
- **Top foydalanuvchilar** -- oxirgi 30 kun ichida eng ko'p trafik ishlatgan foydalanuvchilar

## Foydalanuvchilarni boshqarish

Admin panelda foydalanuvchilar bo'limi orqali:

- Foydalanuvchilar ro'yxatini ko'rish
- Yangi foydalanuvchi yaratish
- Foydalanuvchi sozlamalarini tahrirlash (limitlar, ruxsatlar)
- Foydalanuvchini o'chirish yoki faolsizlantirish
- Parolni o'zgartirish

### Foydalanuvchi tafsilotlari

Har bir foydalanuvchi sahifasida ko'rsatiladi:
- Foydalanuvchi ma'lumotlari va sozlamalari
- Joriy trafik foydalanish hajmi
- Faol tokenlar soni
- Tokenlar ro'yxati

## Tokenlarni boshqarish

Foydalanuvchi sahifasida:

- Foydalanuvchining barcha tokenlarini ko'rish
- Yangi token yaratish
- Tokenni bekor qilish (o'chirish)
- Oxirgi ishlatilgan vaqtni ko'rish

## Faol tunnellar

Faol tunnellar sahifasida hozirda ulangan barcha tunnellar ko'rsatiladi:

| Ustun | Tavsif |
|-------|--------|
| Subdomen / Port | HTTP subdomen yoki TCP port raqami |
| Protokol | `http` yoki `tcp` |
| Foydalanuvchi | Tunnel egasining foydalanuvchi nomi |
| Ulanish vaqti | Tunnel qachon ulanganligi |
| Kiruvchi trafik | Qabul qilingan baytlar |
| Chiquvchi trafik | Yuborilgan baytlar |

## Band qilingan subdomenlar

Admin panelda subdomenlarni boshqarish:

- Band qilingan subdomenlar ro'yxati
- Yangi subdomen band qilish (foydalanuvchiga biriktirish)
- Band qilingan subdomenni bo'shatish

## Trafik analitikasi

Trafik sahifasida:

- Foydalanuvchi bo'yicha kunlik trafik grafigi
- Tizim miqyosidagi top foydalanuvchilar
- Vaqt oralig'ini tanlash (standart: oxirgi 30 kun)

## API endpointlari

Admin panel barcha funksiyalarini REST API orqali ham bajarish mumkin. Batafsil ma'lumot uchun [Admin API](/uz/server/api) sahifasiga qarang.
