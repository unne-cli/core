# البنية المعمارية

## نظرة عامة على النظام

```
┌─────────────────┐         ┌──────────────────────────┐
│   Unne CLI      │         │     Unne Server          │
│                 │   TCP   │                          │
│  Local Service  │◄───────►│  Control Plane (:8222)   │
│  TUI Dashboard  │  yamux  │  HTTP Proxy    (:8223)   │
│  Web Inspector  │         │  Admin Panel   (:4041)   │
│                 │         │  TCP Listeners (dynamic) │
└─────────────────┘         └──────────────────────────┘
```

## تدفق الاتصال

### المصافحة (v2)

```
العميل → الخادم:
  UNNE_HANDSHAKE:v2
  TOKEN:<auth_token>
  PROTOCOL:<http|tcp>
  SUBDOMAIN:<name>           # لـ HTTP
  REMOTE_PORT:<port>         # لـ TCP
  SKIP_WARNING:1             # اختياري

الخادم → العميل:
  UNNE_READY:<subdomain>     # نجاح HTTP
  UNNE_READY_TCP:<port>      # نجاح TCP
  STATUS_UNNE_*              # رموز الخطأ
```

### تدفق طلبات HTTP

```
المتصفح → Server:8223 → استخراج النطاق الفرعي من ترويسة Host
  → البحث عن جلسة yamux → فتح تيار → إعادة التوجيه إلى العميل
  → العميل يعيد التوجيه إلى localhost:PORT → يعود الرد عبر نفس المسار
```

### تدفق طلبات TCP

```
عميل TCP → Server:REMOTE_PORT → فتح تيار yamux
  → إعادة التوجيه إلى العميل → العميل يعيد التوجيه إلى localhost:PORT
  → إعادة توجيه TCP خام ثنائية الاتجاه
```

## تخزين البيانات

| المكون | التخزين | الغرض |
|--------|---------|-------|
| الخادم | SQLite (`unne.db`) | المستخدمون، الرموز، الجلسات، سجلات حركة المرور |
| الخادم | YAML (`config.yml`) | إعدادات الخادم |
| العميل | YAML (`~/.unne/settings.yml`) | إعدادات العميل العامة |
| العميل | YAML (`unne.yml`) | إعداد الأنفاق الخاص بالمشروع |
| العميل | ذاكرة مؤقتة حلقية | تبادلات HTTP الملتقطة |

## هيكل المشروع

```
cmd/
  unne/main.go              # نقطة دخول عميل CLI
  unns/main.go       # نقطة دخول الخادم
internal/
  config/                   # إعداد العميل
  tunnel/                   # عميل النفق + التقاط HTTP
  tui/                      # واجهة المستخدم الطرفية BubbleTea
  webui/                    # مفتش الويب من جانب العميل
  proxy/                    # موصل SOCKS5/HTTP proxy
  server/                   # نواة الخادم + معالج HTTP
  store/                    # طبقة بيانات SQLite
  admin/                    # واجهة ويب لوحة الإدارة
  setup/                    # معالج إعداد الخادم + CLI الإعداد
```
