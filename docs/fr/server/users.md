# Gestion des utilisateurs

Unne Server dispose d'un systeme complet de gestion des utilisateurs avec des limites par utilisateur et un controle d'acces.

## Commandes CLI

```bash
# Creer un utilisateur
unns user create john p@ssw0rd

# Creer un administrateur
unns user create admin secret admin

# Lister les utilisateurs
unns user list

# Supprimer un utilisateur (supprime aussi les jetons associes)
unns user delete 3
```

## Proprietes de l'utilisateur

| Champ | Description | Defaut |
|-------|-------------|--------|
| `username` | Nom de connexion unique | — |
| `password` | Hache avec bcrypt | — |
| `role` | `admin` ou `user` | `user` |
| `enabled` | Compte actif/desactive | `true` |
| `max_tunnels` | Nombre max de tunnels simultanes (`0` = illimite) | `0` |
| `allowed_protocols` | Separes par des virgules : `http`, `tcp`, ou `http,tcp` | `http,tcp` |
| `traffic_limit` | Octets max par periode (`0` = illimite) | `0` |
| `traffic_period` | `daily`, `monthly`, ou `quarterly` | `monthly` |
| `max_devices` | Nombre max de jetons/appareils (`0` = illimite) | `0` |
| `skip_warning` | Autoriser a ignorer l'avertissement du navigateur | `false` |
| `can_use_proxy` | Autoriser l'utilisation d'un proxy | `true` |

## Exemples de controle d'acces

### Utilisateur HTTP uniquement, 5 tunnels max

```bash
unns user create webdev pass123
# Puis via le panneau d'administration : definir allowed_protocols=http, max_tunnels=5
```

### Utilisateur avec limite mensuelle de 1 Go

Definissez `traffic_limit=1073741824` (1 Go en octets) et `traffic_period=monthly` via le panneau d'administration.

### Utilisateur a appareil unique

Definissez `max_devices=1` — un seul jeton peut etre actif. Chaque jeton represente un appareil.

## Panneau d'administration

Les utilisateurs peuvent egalement etre geres via le panneau d'administration web a `http://localhost:4041`. Voir [Panneau d'administration](/fr/server/admin-panel).
