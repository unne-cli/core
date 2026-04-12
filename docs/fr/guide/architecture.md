# Architecture

## Vue d'ensemble du systeme

```
┌─────────────────┐         ┌──────────────────────────┐
│   Unne CLI      │         │     Unne Server          │
│                 │   TCP   │                          │
│  Service local  │◄───────►│  Plan de controle (:8222)│
│  Tableau TUI    │  yamux  │  Proxy HTTP      (:8223) │
│  Inspecteur web │         │  Panneau admin   (:4041) │
│                 │         │  Ecouteurs TCP (dynamique)│
└─────────────────┘         └──────────────────────────┘
```

## Flux de connexion

### Poignee de main (v2)

```
Client → Serveur :
  UNNE_HANDSHAKE:v2
  TOKEN:<jeton_auth>
  PROTOCOL:<http|tcp>
  SUBDOMAIN:<nom>              # pour HTTP
  REMOTE_PORT:<port>           # pour TCP
  SKIP_WARNING:1               # optionnel

Serveur → Client :
  UNNE_READY:<sous-domaine>    # succes HTTP
  UNNE_READY_TCP:<port>        # succes TCP
  STATUS_UNNE_*                # codes d'erreur
```

### Flux des requetes HTTP

```
Navigateur → Serveur:8223 → Extraction du sous-domaine depuis l'en-tete Host
  → Recherche de la session yamux → Ouverture du flux → Transfert au client
  → Le client transfere vers localhost:PORT → La reponse revient par le meme chemin
```

### Flux des requetes TCP

```
Client TCP → Serveur:PORT_DISTANT → Ouverture du flux yamux
  → Transfert au client → Le client transfere vers localhost:PORT
  → Transfert TCP brut bidirectionnel
```

## Stockage des donnees

| Composant | Stockage | Utilisation |
|-----------|----------|-------------|
| Serveur | SQLite (`unne.db`) | Utilisateurs, jetons, sessions, journaux de trafic |
| Serveur | YAML (`config.yml`) | Configuration du serveur |
| Client | YAML (`~/.unne/settings.yml`) | Parametres globaux du client |
| Client | YAML (`unne.yml`) | Configuration locale des tunnels du projet |
| Client | Tampon circulaire en memoire | Echanges HTTP captures |

## Structure du projet

```
cmd/
  unne/main.go              # Point d'entree du client CLI
  unns/main.go       # Point d'entree du serveur
internal/
  config/                   # Configuration du client
  tunnel/                   # Client tunnel + capture HTTP
  tui/                      # Interface terminal BubbleTea
  webui/                    # Inspecteur web cote client
  proxy/                    # Connecteur SOCKS5/HTTP proxy
  server/                   # Coeur du serveur + gestionnaire HTTP
  store/                    # Couche de donnees SQLite
  admin/                    # WebUI du panneau d'administration
  setup/                    # Assistant de configuration serveur + CLI config
```
