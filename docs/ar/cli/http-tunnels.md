# أنفاق HTTP

تكشف أنفاق HTTP خدمة HTTP محلية عبر نطاق فرعي عام على خادم Unne الخاص بك.

## نفق سريع

```bash
unne http 3000
```

ينشئ هذا نفقاً بنطاق فرعي مولّد تلقائياً مثل `a8f3k2m1.tunnel.example.com`.

## نطاق فرعي مخصص

```bash
unne http 3000 --subdomain myapp
```

ستكون خدمتك متاحة على `myapp.tunnel.example.com`.

## من ملف الإعداد

في `unne.yml`:

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
```

تشغيل جميع الأنفاق:

```bash
unne start
```

## أنفاق متعددة

عند تشغيل أنفاق متعددة، تعرض واجهة TUI علامات تبويب لكل نفق (بنمط pm2). استخدم `Tab`/`Shift+Tab` للتبديل بينها.

## تخطي تحذير المتصفح

بشكل افتراضي، يرى زوار المتصفح لأول مرة صفحة تأكيد. لتخطيها (إذا كان حسابك يملك الصلاحية):

```bash
unne http 3000 --skip-warning
```

أو في الإعداد:

```yaml
skip_warning: true
```

## فحص الطلبات

يتم التقاط كل طلب/استجابة HTTP يمر عبر النفق للفحص:
- **TUI**: اضغط `Enter` على طلب لرؤية الترويسات والمحتوى
- **مفتش الويب**: أضف خيار `--webui`، ثم افتح `http://localhost:4040`
