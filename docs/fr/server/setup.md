# Configuration du serveur

## Configuration interactive

Lancez l'assistant de configuration :

```bash
unns setup
```

Il vous sera demande :

1. **Domaine** — ex. `tunnel.example.com`
2. **Port de controle** — connexions des clients (par defaut : `8222`)
3. **Port HTTP** — proxy HTTP public (par defaut : `8223`)
4. **Chemin de la base de donnees** — emplacement de la base SQLite (par defaut : `/etc/unne/unne.db`)
5. **Chemin des journaux** — fichier de journal (par defaut : `/var/log/unne/server.log`)
6. **Panneau d'administration** — activer/desactiver, port
7. **Identifiants administrateur** — nom d'utilisateur et mot de passe

L'assistant va :
- Creer le fichier de configuration (`config.yml`)
- Initialiser la base de donnees SQLite
- Creer l'utilisateur administrateur
- Generer le premier jeton d'authentification

::: tip Sauvegardez votre jeton !
Le jeton genere n'est affiche qu'une seule fois. Copiez-le immediatement.
:::

## Configuration manuelle

Si vous preferez configurer manuellement :

### 1. Creer config.yml

```yaml
server:
  domain: "tunnel.example.com"
  control_port: 8222
  http_port: 8223
storage:
  database: "/etc/unne/unne.db"
logging:
  file_path: "/var/log/unne/server.log"
admin:
  enabled: true
  port: 4041
  session_ttl: "24h"
```

### 2. Creer l'utilisateur administrateur

```bash
unns user create admin votremotdepasse admin
```

### 3. Generer un jeton

```bash
unns token gen 1 mon-laptop
```
