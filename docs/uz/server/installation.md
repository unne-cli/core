# Server o'rnatish

## Tizim talablari

- Linux server (amd64 yoki arm64)
- Umumiy IP manzil
- Wildcard DNS sozlangan domen
- Ochiq portlar: boshqaruv porti (8222), HTTP porti (8223), admin porti (4041)

## Avtomatik o'rnatish

Eng oson usul -- bir qatorlik o'rnatish skripti:

```bash
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

Bu skript quyidagilarni bajaradi:
1. Operatsion tizim va arxitekturani aniqlaydi
2. Oxirgi versiyani GitHub Releases dan yuklab oladi
3. `unns` faylini `/usr/local/bin/` ga joylashtiradi
4. Sozlash ustasini ishga tushiradi

## Qo'lda o'rnatish

### 1. Yuklab olish

[GitHub Releases](https://github.com/unne-cli/core/releases) sahifasidan platformangizga mos versiyani yuklab oling:

```bash
# Linux amd64
curl -Lo unns https://github.com/unne-cli/core/releases/latest/download/unns-linux-amd64

# Linux arm64
curl -Lo unns https://github.com/unne-cli/core/releases/latest/download/unns-linux-arm64
```

### 2. O'rnatish

```bash
chmod +x unns
sudo mv unns /usr/local/bin/
```

### 3. Sozlash

```bash
sudo unns setup
```

Sozlash ustasi haqida batafsil ma'lumot uchun [Server sozlash](/uz/server/setup) sahifasiga qarang.

## Systemd xizmati sifatida o'rnatish

Serverni tizim qayta ishga tushirilganida avtomatik ishga tushirish uchun systemd xizmat fayli yarating:

```bash
sudo tee /etc/systemd/system/unne.service > /dev/null <<EOF
[Unit]
Description=Unne Tunnel Server
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/unns --config /etc/unne/config.yml
Restart=always
RestartSec=5
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF
```

Xizmatni yoqish va ishga tushirish:

```bash
sudo systemctl daemon-reload
sudo systemctl enable unne
sudo systemctl start unne
```

Holatni tekshirish:

```bash
sudo systemctl status unne
```

Loglarni ko'rish:

```bash
sudo journalctl -u unne -f
```

## DNS sozlash

Wildcard DNS yozuvini serveringizga yo'naltiring:

```
*.tunnel.example.com → SIZNING_SERVER_IP
tunnel.example.com → SIZNING_SERVER_IP
```

DNS yozuvini tekshirish:

```bash
dig +short test.tunnel.example.com
# Natija: sizning server IP manzilingiz
```

## TLS / HTTPS (ixtiyoriy)

Unne o'z-o'zida TLS ni boshqarmaydi. HTTPS uchun Unne oldiga teskari proksi o'rnating:

### Caddy bilan

```
*.tunnel.example.com {
    reverse_proxy localhost:8223
}
```

### Nginx bilan

```nginx
server {
    listen 443 ssl;
    server_name *.tunnel.example.com;

    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;

    location / {
        proxy_pass http://localhost:8223;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## Faervol sozlamalari

Kerakli portlarni oching:

```bash
# UFW bilan
sudo ufw allow 8222/tcp  # Boshqaruv porti
sudo ufw allow 8223/tcp  # HTTP proksi porti
sudo ufw allow 4041/tcp  # Admin panel (ixtiyoriy)

# iptables bilan
sudo iptables -A INPUT -p tcp --dport 8222 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8223 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 4041 -j ACCEPT
```

TCP tunnellar uchun kerakli port oralig'ini ham oching (masalan, 10000-65535).

## Yangilash

```bash
# Yangi versiyani yuklab olish
curl -Lo unns https://github.com/unne-cli/core/releases/latest/download/unns-linux-amd64
chmod +x unns
sudo mv unns /usr/local/bin/

# Xizmatni qayta ishga tushirish
sudo systemctl restart unne
```
