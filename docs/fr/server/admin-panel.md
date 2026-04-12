# Panneau d'administration

Le panneau d'administration est un tableau de bord web pour la gestion du serveur Unne. Il fonctionne sur le serveur aux cotes des services de tunnel.

## Activation

Dans `config.yml` :

```yaml
admin:
  enabled: true
  port: 4041
  session_ttl: "24h"
```

Accessible a `http://votre-serveur:4041`.

## Connexion

Utilisez les identifiants administrateur crees lors de `unns setup`. Seuls les utilisateurs avec `role: admin` peuvent acceder au panneau.

## Tableau de bord

Le tableau de bord affiche :
- **Total des utilisateurs** — nombre d'utilisateurs enregistres
- **Tunnels actifs** — tunnels actuellement connectes
- **Trafic du jour** — total des octets transferes aujourd'hui
- **Meilleurs utilisateurs** — utilisateurs classes par trafic (30 jours)

## Page des utilisateurs

Gerez tous les utilisateurs avec des operations CRUD completes :
- Creer des utilisateurs avec des roles et des limites
- Modifier les parametres utilisateur (protocoles, limites, quotas)
- Activer/desactiver les comptes
- Supprimer des utilisateurs (supprime aussi les jetons associes)

## Page des jetons

Gestion des jetons par utilisateur :
- Generer de nouveaux jetons avec des noms d'appareil
- Voir le statut des jetons et la derniere utilisation
- Revoquer des jetons instantanement

## Tunnels actifs

Vue en temps reel de tous les tunnels connectes :
- Point d'acces (sous-domaine ou port)
- Protocole (HTTP/TCP)
- Utilisateur connecte
- Duree de connexion
- Compteurs de trafic (octets entrants/sortants)

## Analytiques

Statistiques de trafic :
- Repartition du trafic par utilisateur
- Agregation quotidienne/mensuelle
- Meilleurs utilisateurs par bande passante

## Securite

- Authentification basee sur les sessions (cookies HttpOnly)
- Hachage des mots de passe avec bcrypt
- Acces reserve aux administrateurs (`role: admin`)
- Les sessions expirent apres la duree configuree (par defaut : 24h)

::: warning
Le panneau d'administration n'inclut pas le HTTPS nativement. Utilisez un reverse proxy (Nginx/Caddy) pour ajouter le chiffrement TLS en production.
:::
