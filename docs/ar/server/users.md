# إدارة المستخدمين

يحتوي خادم Unne على نظام إدارة مستخدمين كامل مع حدود وتحكم في الوصول لكل مستخدم.

## أوامر CLI

```bash
# إنشاء مستخدم
unns user create john p@ssw0rd

# إنشاء مدير
unns user create admin secret admin

# سرد المستخدمين
unns user list

# حذف مستخدم (يحذف الرموز المرتبطة أيضاً)
unns user delete 3
```

## خصائص المستخدم

| الحقل | الوصف | الافتراضي |
|-------|-------|-----------|
| `username` | اسم تسجيل الدخول الفريد | — |
| `password` | مشفر بـ bcrypt | — |
| `role` | `admin` أو `user` | `user` |
| `enabled` | الحساب مفعّل/معطّل | `true` |
| `max_tunnels` | الحد الأقصى للأنفاق المتزامنة (`0` = غير محدود) | `0` |
| `allowed_protocols` | مفصولة بفواصل: `http`، `tcp`، أو `http,tcp` | `http,tcp` |
| `traffic_limit` | الحد الأقصى للبايتات لكل فترة (`0` = غير محدود) | `0` |
| `traffic_period` | `daily`، `monthly`، أو `quarterly` | `monthly` |
| `max_devices` | الحد الأقصى للرموز/الأجهزة (`0` = غير محدود) | `0` |
| `skip_warning` | السماح بتخطي تحذير المتصفح | `false` |
| `can_use_proxy` | السماح باستخدام البروكسي | `true` |

## أمثلة التحكم في الوصول

### مستخدم HTTP فقط، بحد أقصى 5 أنفاق

```bash
unns user create webdev pass123
# ثم عبر لوحة الإدارة: عيّن allowed_protocols=http، max_tunnels=5
```

### مستخدم بحد 1 جيجابايت شهرياً

عيّن `traffic_limit=1073741824` (1 جيجابايت بالبايت) و `traffic_period=monthly` عبر لوحة الإدارة.

### مستخدم بجهاز واحد

عيّن `max_devices=1` — يمكن أن يكون رمز واحد فقط نشطاً. كل رمز يمثل جهازاً واحداً.

## لوحة الإدارة

يمكن أيضاً إدارة المستخدمين عبر لوحة الإدارة المستندة إلى الويب على `http://localhost:4041`. راجع [لوحة الإدارة](/ar/server/admin-panel).
