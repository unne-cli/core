# Installation du serveur

## Installation rapide (recommandee)

Une seule commande — detecte automatiquement l'OS et l'architecture :

```bash
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

Cela telecharge le bon binaire, l'installe, cree un service systemd et lance la configuration initiale.

## Installation manuelle

### 1. Telecharger le binaire

Telechargez depuis les [Releases GitHub](https://github.com/unne-cli/core/releases) pour votre plateforme :

| Binaire | Plateforme |
|---------|------------|
| `unns-linux-amd64` | Linux x86_64 |
| `unns-linux-arm64` | Linux ARM64 |
| `unns-darwin-arm64` | macOS Apple Silicon |
| `unns-darwin-amd64` | macOS Intel |

### 2. Installer

```bash
sudo mkdir -p /etc/unne
sudo cp unns-linux-amd64 /etc/unne/unns
sudo chmod +x /etc/unne/unns
sudo ln -sf /etc/unne/unns /usr/local/bin/unns
```

### 3. Lancer la configuration

```bash
sudo unns setup
```

### 3. Configurer le DNS

Ajoutez un enregistrement DNS wildcard :

```
*.tunnel.votredomaine.com → VOTRE_IP_SERVEUR
```

### 4. Service systemd

Creez `/etc/systemd/system/unne.service` :

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

Activez et demarrez :

```bash
systemctl daemon-reload
systemctl enable unne
systemctl start unne
```

### 5. Reverse proxy (optionnel)

Si vous souhaitez le HTTPS, utilisez Nginx ou Caddy devant le port HTTP :

```nginx
server {
    listen 443 ssl;
    server_name *.tunnel.votredomaine.com;

    ssl_certificate /chemin/vers/cert.pem;
    ssl_certificate_key /chemin/vers/key.pem;

    location / {
        proxy_pass http://127.0.0.1:8223;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # Support WebSocket
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
