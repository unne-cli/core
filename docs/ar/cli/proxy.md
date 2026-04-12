# دعم البروكسي

يمكن لـ Unne CLI توجيه اتصاله بالخادم عبر بروكسيات HTTP أو SOCKS5.

## الاستخدام

### خيار سطر الأوامر

```bash
unne http 3000 --proxy socks5://127.0.0.1:1080
unne http 3000 --proxy http://user:pass@proxy.corp.com:8080
```

### ملف الإعداد

بروكسي عام (لجميع الأنفاق):

```yaml
proxy:
  url: "socks5://127.0.0.1:1080"
```

بروكسي لكل نفق:

```yaml
tunnels:
  - name: web
    protocol: http
    upstream: localhost:3000
    proxy:
      url: "http://corpproxy:8080"
```

## أنواع البروكسي المدعومة

| النظام | البروتوكول | المصادقة |
|--------|-----------|----------|
| `socks5://` | SOCKS5 | اسم المستخدم/كلمة المرور عبر عنوان URL |
| `http://` | HTTP CONNECT | مصادقة Basic عبر عنوان URL |
| `https://` | HTTPS CONNECT | مصادقة Basic عبر عنوان URL |

## المصادقة

أدرج بيانات الاعتماد في عنوان URL للبروكسي:

```
socks5://user:password@proxy:1080
http://user:password@proxy:8080
```

## القيود من جانب الخادم

يمكن لمدير الخادم تعطيل استخدام البروكسي لكل مستخدم. إذا لم يكن حسابك يملك صلاحية `can_use_proxy`، يتم تجاهل إعداد البروكسي على مستوى الاتصال ولكنه لا يسبب خطأ.
