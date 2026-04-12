# Installation du CLI

## Telechargement

Telechargez le binaire correspondant a votre plateforme depuis les [Releases GitHub](https://github.com/unne-cli/core/releases) :

| Fichier | Plateforme |
|---------|------------|
| `unne-darwin-amd64` | macOS Intel |
| `unne-darwin-arm64` | macOS Apple Silicon |
| `unne-linux-amd64` | Linux x86_64 |
| `unne-linux-arm64` | Linux ARM64 |
| `unne-windows-amd64.exe` | Windows x64 |

### macOS / Linux

```bash
# Exemple : macOS Apple Silicon
curl -fsSL -o unne https://github.com/unne-cli/core/releases/download/latest/unne-darwin-arm64
chmod +x unne
sudo mv unne /usr/local/bin/
```

### Windows

Telechargez `unne-windows-amd64.exe` et ajoutez-le a votre PATH.

## Premiere configuration

Apres l'installation, configurez le CLI :

```bash
unne setup
```

Cela cree le fichier `~/.unne/settings.yml` avec les details de connexion a votre serveur :

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "votre-jeton-auth"
```

## Verifier la connexion

```bash
unne check
```

Cela confirme que le CLI peut atteindre le serveur Unne.
