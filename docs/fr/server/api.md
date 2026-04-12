# Reference de l'API d'administration

Le panneau d'administration expose une API REST sur le port d'administration (par defaut : `4041`).

Tous les points d'acces sauf `/api/auth/login` necessitent un cookie de session administrateur.

## Authentification

### Connexion

```
POST /api/auth/login
Content-Type: application/json

{"username": "admin", "password": "secret"}
```

**Reponse :**
```json
{
  "user": {"id": 1, "username": "admin", "role": "admin"}
}
```

Definit le cookie `unne_admin_session`.

### Deconnexion

```
POST /api/auth/logout
```

### Utilisateur actuel

```
GET /api/auth/me
```

---

## Utilisateurs

### Lister les utilisateurs

```
GET /api/users
```

### Creer un utilisateur

```
POST /api/users
Content-Type: application/json

{
  "username": "john",
  "password": "secret",
  "role": "user",
  "max_tunnels": 5,
  "allowed_protocols": "http,tcp",
  "traffic_limit": 1073741824,
  "traffic_period": "monthly",
  "max_devices": 2,
  "skip_warning": false,
  "can_use_proxy": true
}
```

### Obtenir un utilisateur

```
GET /api/users/:id
```

Retourne les details de l'utilisateur + l'utilisation du trafic + le nombre de jetons actifs.

### Modifier un utilisateur

```
PUT /api/users/:id
Content-Type: application/json

{"max_tunnels": 10, "enabled": true}
```

Incluez uniquement les champs que vous souhaitez modifier.

### Supprimer un utilisateur

```
DELETE /api/users/:id
```

Supprime aussi les jetons associes.

---

## Jetons

### Lister les jetons d'un utilisateur

```
GET /api/users/:id/tokens
```

### Generer un jeton

```
POST /api/users/:id/tokens
Content-Type: application/json

{"device_name": "macbook"}
```

**Reponse :**
```json
{
  "token": "a1b2c3d4...",
  "token_id": 5,
  "message": "Sauvegardez ce jeton — il ne sera affiche qu'une seule fois."
}
```

### Revoquer un jeton

```
DELETE /api/tokens/:id
```

---

## Tableau de bord

### Resume

```
GET /api/dashboard
```

**Reponse :**
```json
{
  "total_users": 12,
  "active_tunnels": 5,
  "traffic_today": 1048576,
  "top_users": [...]
}
```

### Tunnels actifs

```
GET /api/tunnels/active
```

**Reponse :**
```json
[
  {
    "subdomain": "myapp",
    "protocol": "http",
    "user_id": 1,
    "username": "john",
    "connected_at": "2026-04-12 15:00:00",
    "bytes_in": 12345,
    "bytes_out": 67890
  }
]
```

### Analytiques de trafic

```
GET /api/analytics/traffic?days=30
GET /api/analytics/traffic?user_id=1&days=7
```
