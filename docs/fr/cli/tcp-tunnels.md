# Tunnels TCP

Les tunnels TCP transmettent du trafic TCP brut, adapte aux bases de donnees, SSH, serveurs de jeux et autres protocoles non-HTTP.

## Tunnel rapide

```bash
# Exposer PostgreSQL local
unne tcp 5432 --remote-port 15432
```

Cela rend votre PostgreSQL local accessible a `tunnel.example.com:15432`.

## Depuis la configuration

```yaml
tunnels:
  - name: database
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432

  - name: ssh
    protocol: tcp
    remote_port: 2222
    upstream: localhost:22
```

## Connexion aux tunnels TCP

```bash
# PostgreSQL
psql -h tunnel.example.com -p 15432 -U monuser madb

# SSH
ssh -p 2222 user@tunnel.example.com

# MySQL
mysql -h tunnel.example.com -P 13306 -u root
```

## Differences avec les tunnels HTTP

| Fonctionnalite | HTTP | TCP |
|----------------|------|-----|
| Routage | Base sur les sous-domaines | Base sur les ports |
| Inspection des requetes | En-tetes + corps complets | Metadonnees de connexion uniquement |
| Page d'avertissement | Oui (configurable) | Non |
| Analyse du protocole | Compatible HTTP | Octets bruts |

## Plage de ports

Les ports distants doivent etre compris entre `1024` et `65535`. Les ports inferieurs a 1024 sont reserves.

Si le port demande est deja utilise, vous recevrez `STATUS_UNNE_PORT_UNAVAILABLE`.
