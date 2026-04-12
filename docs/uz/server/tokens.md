# Tokenlarni boshqarish

Tokenlar Unne CLI dan serverga ulanish uchun ishlatiladigan autentifikatsiya kalitlaridir. Har bir token bitta foydalanuvchiga tegishli bo'lib, qurilma nomi bilan belgilanishi mumkin.

## Xavfsizlik

- Tokenlar serverda **SHA-256 xesh** sifatida saqlanadi
- Ochiq matn token **faqat yaratilganda bir marta** ko'rsatiladi
- Yo'qotilgan tokenni tiklash imkonsiz -- yangi token yaratish kerak
- Har bir token `last_used` maydoniga ega bo'lib, oxirgi ishlatilgan vaqtni kuzatadi

## Token yaratish

### CLI orqali

```bash
# Qurilma nomi bilan
unns token gen 2 laptop

# Qurilma nomisiz
unns token gen 2
```

Natija:

```
Token generated for user 'john':
a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6
Save this token — only the hash is stored.
```

### Admin panel orqali

Admin panelda foydalanuvchi sahifasiga o'ting va **Generate Token** tugmasini bosing.

### Admin API orqali

```bash
curl -X POST http://localhost:4041/api/users/2/tokens \
  -H "Content-Type: application/json" \
  -b "unne_admin_session=SESSION_ID" \
  -d '{"device_name": "laptop"}'
```

Javob:

```json
{
  "token": "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6",
  "token_id": 5,
  "message": "Save this token — it will only be shown once."
}
```

## Tokenlar ro'yxati

### Barcha tokenlar

```bash
unns token list
```

Natija:

```
ID    User            Device          Status   Created              Last Used
------------------------------------------------------------------------------------------
1     admin           default         active   2024-01-15 10:30     2024-01-20 14:22
2     john            laptop          active   2024-01-16 09:00     2024-01-20 12:15
3     john            desktop         active   2024-01-17 11:45     never
4     jane            phone           revoked  2024-01-18 08:20     2024-01-19 16:30
```

### Foydalanuvchi bo'yicha

```bash
unns token list 2
```

## Tokenni bekor qilish

```bash
unns token revoke 4
```

Natija:

```
Token revoked.
```

Admin API orqali:

```bash
curl -X DELETE http://localhost:4041/api/tokens/4 \
  -b "unne_admin_session=SESSION_ID"
```

::: warning Eslatma
Bekor qilingan token bilan faol tunnellar darhol uzilmaydi. Ammo ulanish uzilganida qayta ulanish imkonsiz bo'ladi, chunki handshake `STATUS_UNNE_TOKEN_DISABLED` xatosini qaytaradi.
:::

## Qurilma limiti

Foydalanuvchining `max_devices` sozlamasi bir vaqtda faol bo'lishi mumkin bo'lgan tokenlar (qurilmalar) sonini cheklaydi. Bu faol tunnel ulanishlaridagi noyob tokenlar soni bilan hisoblanadi.

Masalan, `max_devices: 3` degani -- foydalanuvchi bir vaqtda uchta turli tokendan tunnel yaratishi mumkin. Bitta token bilan bir nechta tunnel yaratish bitta qurilma sifatida hisoblanadi.

## Token hayot davri

Tokenlar muddatsiz yaroqli bo'ladi -- avtomatik muddati o'tish yo'q. Tokenni faolsizlantirish uchun uni qo'lda bekor qiling.

Tavsiya etilgan amaliyotlar:
- Har bir qurilma uchun alohida token yarating
- Foydalanilmayotgan tokenlarni bekor qiling
- `last_used` maydonini muntazam tekshirib turing
- Qurilma yo'qolganida yoki o'g'irlanda darhol tokenni bekor qiling
