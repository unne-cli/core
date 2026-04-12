# Server sozlash

## Interaktiv sozlash ustasi

`unns setup` buyrug'i interaktiv sozlash ustasini ishga tushiradi:

```bash
sudo unns setup
```

### Sozlash bosqichlari

```
=== Unne Server Setup ===

Server domain (e.g., done.uz): tunnel.example.com
Control port [8222]: 8222
HTTP proxy port [8223]: 8223
Database path [/etc/unne/unne.db]: /etc/unne/unne.db
Log file path [/var/log/unne/server.log]: /var/log/unne/server.log
Enable admin panel? [Y/n]: Y
Admin panel port [4041]: 4041

--- Admin Account ---
Admin username [admin]: admin
Admin password: ********

=== Configuration Summary ===
  Domain:       tunnel.example.com
  Control Port: 8222
  HTTP Port:    8223
  Database:     /etc/unne/unne.db
  Log File:     /var/log/unne/server.log
  Admin Panel:  :4041 (user: admin)

Apply this configuration? [Y/n]: Y
Config written to /etc/unne/config.yml
Database initialized.
Admin user 'admin' created.

First auth token (save this!):
  a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6
```

### Ustaning bajardigan ishlari

1. **Papkalar yaratish** -- `/etc/unne/`, log papkasi
2. **Konfiguratsiya yozish** -- `config.yml` faylini yaratadi
3. **Ma'lumotlar bazasini ishga tushirish** -- SQLite bazasini va jadvallarni yaratadi
4. **Admin foydalanuvchi yaratish** -- `admin` rolidagi foydalanuvchi
5. **Birinchi token yaratish** -- darhol ishlatish uchun autentifikatsiya tokeni

::: warning Muhim
Birinchi tokenni saqlang! U faqat bir marta ko'rsatiladi. Agar yo'qotib qo'ysangiz, `unns token gen` buyrug'i bilan yangisini yaratishingiz mumkin.
:::

## Konfiguratsiya fayli

Sozlash ustasi tomonidan yaratilgan `config.yml` fayli:

```yaml
server:
  domain: tunnel.example.com
  control_port: 8222
  http_port: 8223
storage:
  database: /etc/unne/unne.db
logging:
  file_path: /var/log/unne/server.log
admin:
  enabled: true
  port: 4041
  session_ttl: 24h
```

Batafsil konfiguratsiya haqida [Server konfiguratsiyasi](/uz/server/configuration) sahifasiga qarang.

## Serverni ishga tushirish

```bash
# To'g'ridan-to'g'ri
unns --config /etc/unne/config.yml

# Yoki standart joylashuvdan
unns
```

Muvaffaqiyatli ishga tushirilganda:

```
Unne Server [tunnel.example.com] Online
Control: 8222 | HTTP Proxy: 8223
Admin panel: http://localhost:4041
```

## Sozlashdan keyingi qadamlar

1. **DNS sozlash** -- Wildcard DNS yozuvini servergizga yo'naltiring
2. **TLS o'rnatish** -- Caddy yoki Nginx orqali HTTPS sozlang
3. **Faervol** -- Kerakli portlarni oching
4. **Systemd** -- Avtomatik ishga tushirish uchun xizmat yarating
5. **Foydalanuvchilar** -- Qo'shimcha foydalanuvchilar va tokenlar yarating

Batafsil ma'lumot uchun [Server o'rnatish](/uz/server/installation) sahifasiga qarang.
