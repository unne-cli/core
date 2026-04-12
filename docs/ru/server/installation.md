# Установка сервера

## Быстрая установка (рекомендуется)

Одна команда -- автоматически определяет ОС и архитектуру:

```bash
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

Это скачает нужный бинарный файл, установит его, создаст systemd-сервис и запустит первоначальную настройку.

## Ручная установка

### 1. Скачайте бинарный файл

Скачайте с [GitHub Releases](https://github.com/unne-cli/core/releases) для вашей платформы:

| Файл | Платформа |
|------|-----------|
| `unns-linux-amd64` | Linux x86_64 |
| `unns-linux-arm64` | Linux ARM64 |
| `unns-darwin-arm64` | macOS Apple Silicon |
| `unns-darwin-amd64` | macOS Intel |

### 2. Установка

```bash
sudo mkdir -p /etc/unne
sudo cp unns-linux-amd64 /etc/unne/unns
sudo chmod +x /etc/unne/unns
sudo ln -sf /etc/unne/unns /usr/local/bin/unns
```

### 3. Запустите настройку

```bash
sudo unns setup
```

### 3. Настройте DNS

Добавьте wildcard DNS-запись:

```
*.tunnel.yourdomain.com → YOUR_SERVER_IP
```

### 4. Systemd-сервис

Создайте `/etc/systemd/system/unne.service`:

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

Активируйте и запустите:

```bash
systemctl daemon-reload
systemctl enable unne
systemctl start unne
```

### 5. Обратный прокси (необязательно)

Если вам нужен HTTPS, используйте Nginx или Caddy перед HTTP-портом:

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

        # Поддержка WebSocket
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
