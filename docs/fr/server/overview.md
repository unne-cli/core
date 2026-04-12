# Apercu du serveur Unne

Unne Server est le composant relais qui accepte les connexions de tunnel des clients CLI et achemine le trafic d'Internet vers les tunnels connectes.

## Commandes

| Commande | Description |
|----------|-------------|
| `unns` | Demarrer le serveur |
| `unns setup` | Configuration interactive initiale |
| `unns config get <cle>` | Obtenir une valeur de configuration |
| `unns config set <cle> <valeur>` | Definir une valeur de configuration |
| `unns config list` | Lister toutes les valeurs de configuration |
| `unns user create <user> <pass> [role]` | Creer un utilisateur |
| `unns user list` | Lister tous les utilisateurs |
| `unns user delete <id>` | Supprimer un utilisateur |
| `unns token gen <user_id> [device]` | Generer un jeton |
| `unns token list [user_id]` | Lister les jetons |
| `unns token revoke <token_id>` | Revoquer un jeton |
| `unns setup-check` | Afficher les informations du serveur pour la configuration du CLI |

## Ports

| Port | Utilisation |
|------|-------------|
| Controle (par defaut : `8222`) | Connexions des clients CLI (yamux) |
| Proxy HTTP (par defaut : `8223`) | Routage du trafic HTTP public |
| Panneau d'administration (par defaut : `4041`) | Administration via interface web |
| TCP (dynamique) | Ecouteurs TCP par tunnel |

## Stockage

Unne Server utilise SQLite pour la persistance des donnees :

- **Utilisateurs** — comptes avec roles et limites
- **Jetons** — jetons d'authentification lies aux utilisateurs et appareils
- **Sessions** — sessions de connexion au panneau d'administration
- **Journal de trafic** — suivi du trafic par utilisateur pour les quotas
