# إعداد الخادم

## ملف الإعداد

الموقع الافتراضي: نفس مجلد الملف التنفيذي (`config.yml`) أو يُحدد بـ `--config`.

```yaml
server:
  domain: "tunnel.example.com"   # نطاقك
  control_port: 8222             # منفذ اتصالات CLI
  http_port: 8223                # منفذ وكيل HTTP

storage:
  database: "/etc/unne/unne.db"  # مسار قاعدة بيانات SQLite

logging:
  file_path: "/var/log/unne/server.log"

admin:
  enabled: true                  # تفعيل لوحة الإدارة
  port: 4041                     # منفذ لوحة الإدارة
  session_ttl: "24h"             # مدة جلسة الإدارة
```

## أوامر الإعداد بنمط Git

اقرأ وعدّل قيم الإعداد دون تحرير YAML يدوياً:

```bash
# الحصول على قيمة
unns config get server.domain
# → tunnel.example.com

# تعيين قيمة
unns config set server.domain newtunnel.example.com

# سرد جميع القيم
unns config list
# → server.domain = tunnel.example.com
# → server.control_port = 8222
# → server.http_port = 8223
# → storage.database = /etc/unne/unne.db
# → ...
```

## مسار إعداد مخصص

```bash
unns --config /path/to/config.yml
```

## مرجع الإعدادات

| المفتاح | النوع | الافتراضي | الوصف |
|---------|-------|-----------|-------|
| `server.domain` | string | — | نطاق الخادم للنطاقات الفرعية |
| `server.control_port` | int | `8222` | منفذ اتصال CLI |
| `server.http_port` | int | `8223` | منفذ وكيل HTTP |
| `storage.database` | string | `/etc/unne/unne.db` | مسار قاعدة بيانات SQLite |
| `logging.file_path` | string | — | مسار ملف السجل |
| `admin.enabled` | bool | `true` | تفعيل لوحة الإدارة |
| `admin.port` | int | `4041` | منفذ لوحة الإدارة |
| `admin.session_ttl` | string | `24h` | مدة جلسة الإدارة |
