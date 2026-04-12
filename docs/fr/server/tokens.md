# Gestion des jetons

Les jetons sont des identifiants d'authentification que les clients CLI utilisent pour se connecter au serveur. Chaque jeton est lie a un utilisateur et optionnellement a un appareil.

## Commandes CLI

```bash
# Generer un jeton pour l'utilisateur ID 1
unns token gen 1

# Generer avec un nom d'appareil
unns token gen 1 macbook-pro

# Lister tous les jetons
unns token list

# Lister les jetons d'un utilisateur specifique
unns token list 1

# Revoquer un jeton
unns token revoke 3
```

## Proprietes du jeton

| Champ | Description |
|-------|-------------|
| `hash` | Hachage SHA-256 (stocke, jamais en texte clair) |
| `user_id` | Utilisateur proprietaire |
| `device_name` | Identifiant d'appareil optionnel |
| `enabled` | Actif ou revoque |
| `created_at` | Horodatage de creation |
| `last_used` | Derniere authentification reussie |

## Fonctionnement des jetons

1. L'administrateur genere un jeton → le jeton brut est affiche une seule fois
2. Le jeton est transmis a l'utilisateur
3. L'utilisateur execute `unne setup` et entre le jeton
4. Le CLI envoie le jeton lors de la poignee de main
5. Le serveur le hache et recherche le hachage dans la base de donnees
6. Le jeton herite de toutes les limites de son utilisateur parent

## Jeton = Appareil

Lorsque `max_devices` est defini sur un utilisateur, chaque jeton compte comme un appareil. Si un utilisateur a `max_devices=2`, il peut avoir au maximum 2 jetons actifs connectes simultanement.

## Securite

- Les jetons sont stockes uniquement sous forme de hachages SHA-256
- Le jeton brut est affiche une seule fois lors de la generation et n'est jamais stocke
- La revocation d'un jeton deconnecte immediatement le client
- Les jetons peuvent etre geres via le CLI ou le [Panneau d'administration](/fr/server/admin-panel)
