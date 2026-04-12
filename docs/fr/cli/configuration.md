# Configuration du CLI

Unne CLI utilise deux fichiers de configuration qui sont fusionnes ensemble :

## Parametres globaux (`~/.unne/settings.yml`)

Cree par `unne setup`. Contient les informations de connexion au serveur :

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "votre-jeton-auth"
```

## Configuration du projet (`unne.yml`)

Placez-le a la racine de votre projet pour definir les tunnels :

```yaml
version: "3"

# Remplacer les parametres globaux (optionnel)
# server: "tunnel.example.com"
# port: 8222
# authtoken: "votre-jeton-auth"

# Proxy pour toutes les connexions (optionnel)
# proxy:
#   url: "socks5://127.0.0.1:1080"

# Parametres de l'interface
gui:
  tui: true           # Activer l'interface terminal
  webui: false        # Activer l'inspecteur web
  webui_port: 4040    # Port de l'inspecteur web

# Ignorer la page d'avertissement du navigateur
# skip_warning: true

tunnels:
  - name: web-app
    protocol: http
    subdomain: monapp        # optionnel, genere automatiquement si omis
    upstream: localhost:3000

  - name: api
    protocol: http
    upstream: localhost:8080

  - name: postgres
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432
```

## Fusion de la configuration

Les parametres sont fusionnes dans cet ordre (le dernier remplace le precedent) :

1. `~/.unne/settings.yml` (valeurs par defaut globales)
2. `unne.yml` (configuration du projet)
3. Options CLI (`--proxy`, `--subdomain`, etc.)

## Utiliser un chemin de configuration personnalise

```bash
unne start --config /chemin/vers/custom.yml
```
