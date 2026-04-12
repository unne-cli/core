# Codes d'erreur

Unne utilise des codes d'erreur standardises prefixes par `STATUS_UNNE_`.

## Reference des codes d'erreur

| Code | Description |
|------|-------------|
| `STATUS_UNNE_AUTH_FAILED` | Jeton d'authentification invalide ou expire |
| `STATUS_UNNE_SUBDOMAIN_TAKEN` | Le sous-domaine demande est deja utilise |
| `STATUS_UNNE_PROTOCOL_ERROR` | Erreur de protocole lors de la poignee de main (requete mal formee) |
| `STATUS_UNNE_TUNNEL_LIMIT` | Limite maximale de tunnels atteinte pour votre compte |
| `STATUS_UNNE_PROTOCOL_DENIED` | Votre compte n'est pas autorise a utiliser ce protocole |
| `STATUS_UNNE_TRAFFIC_EXCEEDED` | Limite de trafic depassee pour la periode en cours |
| `STATUS_UNNE_DEVICE_LIMIT` | Limite maximale d'appareils atteinte pour votre compte |
| `STATUS_UNNE_USER_DISABLED` | Votre compte utilisateur a ete desactive par l'administrateur |
| `STATUS_UNNE_TOKEN_DISABLED` | Ce jeton a ete revoque ou desactive |
| `STATUS_UNNE_PORT_UNAVAILABLE` | Le port TCP demande n'est pas disponible |
| `STATUS_UNNE_SERVER_ERROR` | Erreur interne du serveur |

## Pages d'erreur HTTP

Lors de l'acces a un tunnel via le navigateur, le serveur affiche des pages d'erreur stylisees :

| Page | Statut HTTP | Quand |
|------|-------------|-------|
| **Avertissement** | 200 | Premiere visite depuis un navigateur (confirmation requise) |
| **Non trouve** | 404 | Le tunnel/sous-domaine n'existe pas |
| **Hors ligne** | 502 | Le tunnel existe mais le service en amont est inaccessible |
| **Erreur** | Variable | Erreur generique avec code et description |

## Codes d'erreur historiques

Pour la compatibilite avec les anciens serveurs :

| Ancien | Nouveau code |
|--------|--------------|
| `UNNE_ERR_403` | `STATUS_UNNE_AUTH_FAILED` |
| `UNNE_ERR_102` | `STATUS_UNNE_SUBDOMAIN_TAKEN` |
| `UNNE_ERR_101` | `STATUS_UNNE_PROTOCOL_ERROR` |
