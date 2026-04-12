# Server konfiguratsiyasi

## Konfiguratsiya fayli

Joylashuv: `/etc/unne/config.yml` (standart)

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

## Konfiguratsiya parametrlari

### `server` bo'limi

| Parametr | Tur | Standart | Tavsif |
|----------|-----|----------|--------|
| `domain` | string | | Server domeni. Subdomenlar shu domen ostida yaratiladi. |
| `control_port` | int | `8222` | Boshqaruv tekisligi porti. Mijozlar shu portga ulanadi. |
| `http_port` | int | `8223` | HTTP proksi porti. Brauzer so'rovlari shu portga keladi. |

### `storage` bo'limi

| Parametr | Tur | Standart | Tavsif |
|----------|-----|----------|--------|
| `database` | string | `/etc/unne/unne.db` | SQLite ma'lumotlar bazasi fayl yo'li |

### `logging` bo'limi

| Parametr | Tur | Standart | Tavsif |
|----------|-----|----------|--------|
| `file_path` | string | `/var/log/unne/server.log` | Log fayli yo'li |

### `admin` bo'limi

| Parametr | Tur | Standart | Tavsif |
|----------|-----|----------|--------|
| `enabled` | bool | `true` | Admin panelni yoqish/o'chirish |
| `port` | int | `4041` | Admin panel porti |
| `session_ttl` | string | `"24h"` | Admin sessiya muddati (Go duration formati) |

## CLI orqali konfiguratsiyani boshqarish

### Qiymat olish

```bash
unns config get server.domain
# tunnel.example.com

unns config get admin.port
# 4041
```

### Qiymat o'rnatish

```bash
unns config set server.domain newtunnel.example.com
# server.domain = newtunnel.example.com

unns config set admin.session_ttl 12h
# admin.session_ttl = 12h
```

### Barcha qiymatlarni ko'rish

```bash
unns config list
```

Natija:

```
server.domain = tunnel.example.com
server.control_port = 8222
server.http_port = 8223
storage.database = /etc/unne/unne.db
logging.file_path = /var/log/unne/server.log
admin.enabled = true
admin.port = 4041
admin.session_ttl = 24h
```

## Maxsus konfiguratsiya fayl

Standart bo'lmagan joylashuvdagi konfiguratsiya faylini ishlatish:

```bash
unns --config /path/to/custom-config.yml
```

## Muhit sozlamalari

### Portlarni o'zgartirish

Standart portlarni o'zgartirganingizda, faervol va teskari proksi sozlamalarini ham yangilashni unutmang:

```yaml
server:
  control_port: 9222    # Standart: 8222
  http_port: 9223       # Standart: 8223
admin:
  port: 9041            # Standart: 4041
```

### Ma'lumotlar bazasi joylashuvi

Ma'lumotlar bazasi faylini boshqa joylashuvga ko'chirish:

```yaml
storage:
  database: /var/lib/unne/data.db
```

::: tip Maslahat
SQLite WAL rejimida ishlaydi (`journal_mode=wal`), bu bir vaqtda o'qish va yozishni qo'llab-quvvatlaydi. Ma'lumotlar bazasi faylini tarmoq papkasiga (NFS) joylashtirmang.
:::

### Admin sessiya muddati

Sessiya muddatini Go duration formatida ko'rsating:

```yaml
admin:
  session_ttl: "12h"    # 12 soat
  session_ttl: "168h"   # 1 hafta
  session_ttl: "720h"   # 30 kun
```
