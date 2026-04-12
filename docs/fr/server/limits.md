# Limites et quotas

Unne Server prend en charge des limites par utilisateur pour controler l'utilisation des ressources.

## Limites disponibles

| Limite | Description | Defaut |
|--------|-------------|--------|
| `max_tunnels` | Nombre max de tunnels simultanes | `0` (illimite) |
| `max_devices` | Nombre max de connexions de jetons simultanees | `0` (illimite) |
| `allowed_protocols` | Protocoles de tunnel autorises | `http,tcp` |
| `traffic_limit` | Trafic max par periode (octets) | `0` (illimite) |
| `traffic_period` | Periode de la limite : `daily`, `monthly`, `quarterly` | `monthly` |
| `skip_warning` | Autoriser les clients a ignorer l'avertissement du navigateur | `false` |
| `can_use_proxy` | Autoriser les connexions via proxy | `true` |

## Application des limites

Les limites sont verifiees lors de la poignee de main quand un client se connecte :

1. **Validation du jeton** — le jeton existe et est actif
2. **Validation de l'utilisateur** — l'utilisateur existe et est actif
3. **Verification du protocole** — le protocole demande est dans `allowed_protocols`
4. **Limite d'appareils** — nombre de jetons actifs uniques pour cet utilisateur
5. **Limite de tunnels** — nombre de tunnels actifs pour cet utilisateur
6. **Limite de trafic** — octets accumules pour la periode en cours

Si une verification echoue, la connexion est rejetee avec le code d'erreur `STATUS_UNNE_*` approprie.

## Suivi du trafic

Le trafic est suivi par tunnel et enregistre dans la base de donnees toutes les 30 secondes. Les compteurs incluent les octets entrants et sortants.

### Periodes de trafic

| Periode | Reinitialisation |
|---------|-----------------|
| `daily` | Minuit (fuseau horaire du serveur) |
| `monthly` | 1er de chaque mois |
| `quarterly` | 1er janvier, 1er avril, 1er juillet, 1er octobre |

## Exemples

### Offre gratuite : HTTP uniquement, 3 tunnels, 1 Go/mois

```
max_tunnels: 3
allowed_protocols: http
traffic_limit: 1073741824
traffic_period: monthly
max_devices: 1
```

### Offre Pro : illimite

```
max_tunnels: 0
allowed_protocols: http,tcp
traffic_limit: 0
max_devices: 0
skip_warning: true
```

## Definition des limites

Les limites peuvent etre definies via :
- **Panneau d'administration** — formulaire de modification de l'utilisateur
- **CLI** — `unns user create` (basique), puis modification via le panneau d'administration pour les limites detaillees
