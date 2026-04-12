# Support proxy

Unne CLI peut acheminer sa connexion au serveur via des proxys HTTP ou SOCKS5.

## Utilisation

### Option CLI

```bash
unne http 3000 --proxy socks5://127.0.0.1:1080
unne http 3000 --proxy http://user:pass@proxy.corp.com:8080
```

### Fichier de configuration

Proxy global (pour tous les tunnels) :

```yaml
proxy:
  url: "socks5://127.0.0.1:1080"
```

Proxy par tunnel :

```yaml
tunnels:
  - name: web
    protocol: http
    upstream: localhost:3000
    proxy:
      url: "http://corpproxy:8080"
```

## Types de proxy supportes

| Schema | Protocole | Authentification |
|--------|-----------|-----------------|
| `socks5://` | SOCKS5 | Nom d'utilisateur/mot de passe via l'URL |
| `http://` | HTTP CONNECT | Authentification basique via l'URL |
| `https://` | HTTPS CONNECT | Authentification basique via l'URL |

## Authentification

Incluez les identifiants dans l'URL du proxy :

```
socks5://user:password@proxy:1080
http://user:password@proxy:8080
```

## Restrictions cote serveur

L'administrateur du serveur peut desactiver l'utilisation du proxy par utilisateur. Si votre compte n'a pas la permission `can_use_proxy`, le parametre proxy est ignore au niveau de la connexion mais ne provoque pas d'erreur.
