# Apercu du CLI Unne

Unne CLI est l'application cliente qui cree des tunnels depuis votre machine locale vers un serveur Unne.

## Commandes

| Commande | Description |
|----------|-------------|
| `unne setup` | Configuration interactive pour la premiere utilisation |
| `unne http <port>` | Tunnel HTTP rapide sur un port local |
| `unne tcp <port>` | Tunnel TCP rapide sur un port local |
| `unne start` | Demarrer les tunnels definis dans `unne.yml` |
| `unne check` | Verifier la connectivite au serveur |
| `unne version` | Afficher les informations de version |
| `unne help` | Afficher l'aide |

## Options globales

| Option | Description |
|--------|-------------|
| `--config <chemin>` | Chemin vers le fichier de configuration (par defaut : `unne.yml`) |
| `--subdomain <nom>` | Sous-domaine souhaite (HTTP uniquement) |
| `--remote-port <port>` | Port distant (TCP uniquement) |
| `--proxy <url>` | URL du proxy (`socks5://` ou `http://`) |
| `--skip-warning`, `--sw` | Ignorer la page d'avertissement du navigateur |
| `--no-tui` | Desactiver le TUI, utiliser la sortie en mode journal |
| `--webui` | Activer l'inspecteur web |
| `--webui-port <port>` | Port de l'inspecteur web (par defaut : `4040`) |

## Exemples rapides

```bash
# Exposer une application web locale
unne http 3000

# Exposer avec un sous-domaine personnalise
unne http 3000 --subdomain monapp

# Tunnel TCP pour PostgreSQL
unne tcp 5432 --remote-port 15432

# Demarrer tous les tunnels depuis la configuration avec l'inspecteur web
unne start --webui

# Mode headless a travers un proxy
unne http 8080 --no-tui --proxy socks5://127.0.0.1:1080
```
