# تثبيت واجهة سطر الأوامر

## التنزيل

قم بتنزيل الملف التنفيذي لمنصتك من [إصدارات GitHub](https://github.com/unne-cli/core/releases):

| الملف | المنصة |
|-------|--------|
| `unne-darwin-amd64` | macOS Intel |
| `unne-darwin-arm64` | macOS Apple Silicon |
| `unne-linux-amd64` | Linux x86_64 |
| `unne-linux-arm64` | Linux ARM64 |
| `unne-windows-amd64.exe` | Windows x64 |

### macOS / Linux

```bash
# مثال: macOS Apple Silicon
curl -fsSL -o unne https://github.com/unne-cli/core/releases/download/latest/unne-darwin-arm64
chmod +x unne
sudo mv unne /usr/local/bin/
```

### Windows

قم بتنزيل `unne-windows-amd64.exe` وأضفه إلى متغير PATH.

## الإعداد لأول مرة

بعد التثبيت، قم بإعداد واجهة سطر الأوامر:

```bash
unne setup
```

يقوم هذا بإنشاء `~/.unne/settings.yml` مع تفاصيل اتصال الخادم:

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## التحقق من الاتصال

```bash
unne check
```

يؤكد هذا أن واجهة سطر الأوامر يمكنها الوصول إلى خادم Unne.
