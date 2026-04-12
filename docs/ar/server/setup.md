# إعداد الخادم

## الإعداد التفاعلي

شغّل معالج الإعداد:

```bash
unns setup
```

سيُطلب منك إدخال:

1. **النطاق** — مثال: `tunnel.example.com`
2. **منفذ التحكم** — اتصالات العملاء (الافتراضي: `8222`)
3. **منفذ HTTP** — وكيل HTTP العام (الافتراضي: `8223`)
4. **مسار قاعدة البيانات** — موقع قاعدة بيانات SQLite (الافتراضي: `/etc/unne/unne.db`)
5. **مسار السجلات** — ملف السجل (الافتراضي: `/var/log/unne/server.log`)
6. **لوحة الإدارة** — تفعيل/تعطيل، المنفذ
7. **بيانات اعتماد المدير** — اسم المستخدم وكلمة المرور

سيقوم المعالج بـ:
- إنشاء ملف الإعداد (`config.yml`)
- تهيئة قاعدة بيانات SQLite
- إنشاء مستخدم المدير
- إنشاء أول رمز مصادقة

::: tip احفظ رمز المصادقة!
يُعرض الرمز المُنشأ مرة واحدة فقط. انسخه فوراً.
:::

## الإعداد اليدوي

إذا كنت تفضل الإعداد يدوياً:

### 1. إنشاء config.yml

```yaml
server:
  domain: "tunnel.example.com"
  control_port: 8222
  http_port: 8223
storage:
  database: "/etc/unne/unne.db"
logging:
  file_path: "/var/log/unne/server.log"
admin:
  enabled: true
  port: 4041
  session_ttl: "24h"
```

### 2. إنشاء مستخدم المدير

```bash
unns user create admin yourpassword admin
```

### 3. إنشاء رمز مصادقة

```bash
unns token gen 1 my-laptop
```
