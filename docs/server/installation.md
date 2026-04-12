# Server Installation

## Quick Install (Recommended)

One command — auto-detects OS and architecture:

```bash
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

This will download the correct binary, install it, create a systemd service, and run the initial setup.

## Manual Install

### 1. Download the binary

Download from [GitHub Releases](https://github.com/unne-cli/core/releases) for your platform:

| Binary | Platform |
|--------|----------|
| `unns-linux-amd64` | Linux x86_64 |
| `unns-linux-arm64` | Linux ARM64 |
| `unns-darwin-arm64` | macOS Apple Silicon |
| `unns-darwin-amd64` | macOS Intel |

### 2. Install

```bash
sudo mkdir -p /etc/unne
sudo cp unns-linux-amd64 /etc/unne/unns
sudo chmod +x /etc/unne/unns
sudo ln -sf /etc/unne/unns /usr/local/bin/unns
```

### 3. Run setup

```bash
sudo unns setup
```

### 3. Configure DNS

Add a wildcard DNS record:

```
*.tunnel.yourdomain.com → YOUR_SERVER_IP
```

### 4. Systemd Service

Create `/etc/systemd/system/unne.service`:

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

Enable and start:

```bash
systemctl daemon-reload
systemctl enable unne
systemctl start unne
```

### 5. Reverse Proxy (Optional)

If you want HTTPS, use Nginx or Caddy in front of the HTTP port:

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

        # WebSocket support
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
