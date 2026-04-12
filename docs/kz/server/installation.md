# Серверді орнату

## Жылдам орнату (ұсынылады)

Бір команда -- ОЖ мен архитектураны автоматты анықтайды:

```bash
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

Бұл дұрыс бинарлық файлды жүктеп алады, орнатады, systemd қызметін жасайды және бастапқы баптауды іске қосады.

## Қолмен орнату

### 1. Бинарлық файлды жүктеп алу

Платформаңыз үшін [GitHub Releases](https://github.com/unne-cli/core/releases) бетінен жүктеп алыңыз:

| Бинарлық файл | Платформа |
|---------------|-----------|
| `unns-linux-amd64` | Linux x86_64 |
| `unns-linux-arm64` | Linux ARM64 |
| `unns-darwin-arm64` | macOS Apple Silicon |
| `unns-darwin-amd64` | macOS Intel |

### 2. Орнату

```bash
sudo mkdir -p /etc/unne
sudo cp unns-linux-amd64 /etc/unne/unns
sudo chmod +x /etc/unne/unns
sudo ln -sf /etc/unne/unns /usr/local/bin/unns
```

### 3. Баптауды іске қосу

```bash
sudo unns setup
```

### 3. DNS баптау

Wildcard DNS жазбасын қосыңыз:

```
*.tunnel.yourdomain.com → YOUR_SERVER_IP
```

### 4. Systemd қызметі

`/etc/systemd/system/unne.service` файлын жасаңыз:

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

Қосу және іске қосу:

```bash
systemctl daemon-reload
systemctl enable unne
systemctl start unne
```

### 5. Кері прокси (міндетті емес)

HTTPS қажет болса, HTTP портының алдына Nginx немесе Caddy қойыңыз:

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

        # WebSocket қолдауы
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
