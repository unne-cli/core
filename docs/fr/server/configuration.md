# Configuration du serveur

## Fichier de configuration

Emplacement par defaut : meme repertoire que le binaire (`config.yml`) ou specifie avec `--config`.

```yaml
server:
  domain: "tunnel.example.com"   # Votre domaine
  control_port: 8222             # Port pour les connexions CLI
  http_port: 8223                # Port pour le proxy HTTP

storage:
  database: "/etc/unne/unne.db"  # Chemin de la base SQLite

logging:
  file_path: "/var/log/unne/server.log"

admin:
  enabled: true                  # Activer le panneau d'administration
  port: 4041                     # Port du panneau d'administration
  session_ttl: "24h"             # Duree de la session admin
```

## Commandes de configuration style Git

Lisez et modifiez les valeurs de configuration sans editer le YAML manuellement :

```bash
# Obtenir une valeur
unns config get server.domain
# → tunnel.example.com

# Definir une valeur
unns config set server.domain newtunnel.example.com

# Lister toutes les valeurs
unns config list
# → server.domain = tunnel.example.com
# → server.control_port = 8222
# → server.http_port = 8223
# → storage.database = /etc/unne/unne.db
# → ...
```

## Chemin de configuration personnalise

```bash
unns --config /chemin/vers/config.yml
```

## Reference de configuration

| Cle | Type | Defaut | Description |
|-----|------|--------|-------------|
| `server.domain` | string | — | Domaine du serveur pour les sous-domaines |
| `server.control_port` | int | `8222` | Port de connexion CLI |
| `server.http_port` | int | `8223` | Port du proxy HTTP |
| `storage.database` | string | `/etc/unne/unne.db` | Chemin de la base SQLite |
| `logging.file_path` | string | — | Chemin du fichier de journal |
| `admin.enabled` | bool | `true` | Activer le panneau d'administration |
| `admin.port` | int | `4041` | Port du panneau d'administration |
| `admin.session_ttl` | string | `24h` | Duree de la session admin |
