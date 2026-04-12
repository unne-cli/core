# تثبيت الخادم

## التثبيت السريع (موصى به)

أمر واحد — يكتشف نظام التشغيل والمعمارية تلقائياً:

```bash
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

سيقوم هذا بتنزيل الملف التنفيذي الصحيح، وتثبيته، وإنشاء خدمة systemd، وتشغيل الإعداد الأولي.

## التثبيت اليدوي

### 1. تنزيل الملف التنفيذي

قم بالتنزيل من [إصدارات GitHub](https://github.com/unne-cli/core/releases) لمنصتك:

| الملف التنفيذي | المنصة |
|---------------|--------|
| `unns-linux-amd64` | Linux x86_64 |
| `unns-linux-arm64` | Linux ARM64 |
| `unns-darwin-arm64` | macOS Apple Silicon |
| `unns-darwin-amd64` | macOS Intel |

### 2. التثبيت

```bash
sudo mkdir -p /etc/unne
sudo cp unns-linux-amd64 /etc/unne/unns
sudo chmod +x /etc/unne/unns
sudo ln -sf /etc/unne/unns /usr/local/bin/unns
```

### 3. تشغيل الإعداد

```bash
sudo unns setup
```

### 3. إعداد DNS

أضف سجل DNS بحرف البدل:

```
*.tunnel.yourdomain.com → YOUR_SERVER_IP
```

### 4. خدمة Systemd

أنشئ `/etc/systemd/system/unne.service`:

```ini
[Unit]
Description=Unne Tunnel Server
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/etc/unne
ExecStart=/etc/unne/unns --config /etc/unne/config.yml
Restart=always

[Install]
WantedBy=multi-user.target
```

التفعيل والتشغيل:

```bash
systemctl daemon-reload
systemctl enable unne
systemctl start unne
```

### 5. وكيل عكسي (اختياري)

إذا كنت تريد HTTPS، استخدم Nginx أو Caddy أمام منفذ HTTP:

```nginx
server {
    listen 443 ssl;
    server_name *.tunnel.yourdomain.com;

    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;

    location / {
        proxy_pass http://127.0.0.1:8223;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # دعم WebSocket
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
