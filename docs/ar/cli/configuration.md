# إعداد واجهة سطر الأوامر

يستخدم Unne CLI ملفي إعداد يتم دمجهما معاً:

## الإعدادات العامة (`~/.unne/settings.yml`)

يتم إنشاؤه بواسطة `unne setup`. يحتوي على معلومات الاتصال بالخادم:

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## إعداد المشروع (`unne.yml`)

ضعه في جذر مشروعك لتعريف الأنفاق:

```yaml
version: "3"

# تجاوز الإعدادات العامة (اختياري)
# server: "tunnel.example.com"
# port: 8222
# authtoken: "your-auth-token"

# بروكسي لجميع الاتصالات (اختياري)
# proxy:
#   url: "socks5://127.0.0.1:1080"

# إعدادات الواجهة
gui:
  tui: true           # تفعيل واجهة المستخدم الطرفية
  webui: false        # تفعيل مفتش الويب
  webui_port: 4040    # منفذ مفتش الويب

# تخطي صفحة تحذير المتصفح
# skip_warning: true

tunnels:
  - name: web-app
    protocol: http
    subdomain: myapp        # اختياري، يُولَّد تلقائياً إذا تُرك فارغاً
    upstream: localhost:3000

  - name: api
    protocol: http
    upstream: localhost:8080

  - name: postgres
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432
```

## دمج الإعدادات

يتم دمج الإعدادات بهذا الترتيب (اللاحق يتجاوز السابق):

1. `~/.unne/settings.yml` (الإعدادات الافتراضية العامة)
2. `unne.yml` (إعداد المشروع)
3. خيارات سطر الأوامر (`--proxy`، `--subdomain`، إلخ.)

## استخدام مسار إعداد مخصص

```bash
unne start --config /path/to/custom.yml
```
