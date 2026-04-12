# أنفاق TCP

تقوم أنفاق TCP بإعادة توجيه حركة مرور TCP الخام، وهي مناسبة لقواعد البيانات وSSH وخوادم الألعاب والبروتوكولات غير HTTP الأخرى.

## نفق سريع

```bash
# كشف PostgreSQL المحلي
unne tcp 5432 --remote-port 15432
```

يجعل هذا قاعدة بيانات PostgreSQL المحلية متاحة على `tunnel.example.com:15432`.

## من ملف الإعداد

```yaml
tunnels:
  - name: database
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432

  - name: ssh
    protocol: tcp
    remote_port: 2222
    upstream: localhost:22
```

## الاتصال بأنفاق TCP

```bash
# PostgreSQL
psql -h tunnel.example.com -p 15432 -U myuser mydb

# SSH
ssh -p 2222 user@tunnel.example.com

# MySQL
mysql -h tunnel.example.com -P 13306 -u root
```

## الفروقات عن أنفاق HTTP

| الميزة | HTTP | TCP |
|--------|------|-----|
| التوجيه | قائم على النطاق الفرعي | قائم على المنفذ |
| فحص الطلبات | ترويسات + محتوى كامل | بيانات الاتصال الوصفية فقط |
| صفحة التحذير | نعم (قابلة للتكوين) | لا |
| تحليل البروتوكول | واعٍ بـ HTTP | بايتات خام |

## نطاق المنافذ

يجب أن تكون المنافذ البعيدة بين `1024` و `65535`. المنافذ أقل من 1024 محجوزة.

إذا كان المنفذ المطلوب قيد الاستخدام بالفعل، ستتلقى `STATUS_UNNE_PORT_UNAVAILABLE`.
