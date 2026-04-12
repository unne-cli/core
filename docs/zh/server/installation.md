# 服务器安装

## 快速安装（推荐）

一条命令 — 自动检测操作系统和架构：

```bash
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

这将下载正确的二进制文件，安装它，创建 systemd 服务，并运行初始配置。

## 手动安装

### 1. 下载二进制文件

从 [GitHub Releases](https://github.com/unne-cli/core/releases) 下载适合你平台的文件：

| 二进制文件 | 平台 |
|------------|------|
| `unns-linux-amd64` | Linux x86_64 |
| `unns-linux-arm64` | Linux ARM64 |
| `unns-darwin-arm64` | macOS Apple Silicon |
| `unns-darwin-amd64` | macOS Intel |

### 2. 安装

```bash
sudo mkdir -p /etc/unne
sudo cp unns-linux-amd64 /etc/unne/unns
sudo chmod +x /etc/unne/unns
sudo ln -sf /etc/unne/unns /usr/local/bin/unns
```

### 3. 运行配置

```bash
sudo unns setup
```

### 3. 配置 DNS

添加通配符 DNS 记录：

```
*.tunnel.yourdomain.com → YOUR_SERVER_IP
```

### 4. Systemd 服务

创建 `/etc/systemd/system/unne.service`：

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

启用并启动：

```bash
systemctl daemon-reload
systemctl enable unne
systemctl start unne
```

### 5. 反向代理（可选）

如果你需要 HTTPS，可以在 HTTP 端口前面使用 Nginx 或 Caddy：

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

        # WebSocket 支持
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
