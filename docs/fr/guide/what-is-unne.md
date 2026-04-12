# Qu'est-ce qu'Unne ?

Unne est une solution de tunneling auto-hebergee qui vous permet d'exposer des services locaux sur Internet via votre propre serveur. Considerez-le comme une alternative auto-hebergee a ngrok, Cloudflare Tunnel ou localtunnel.

## Composants

Unne se compose de deux parties :

| Composant | Description |
|-----------|-------------|
| **Unne CLI** (`unne`) | Application cliente qui s'execute sur votre machine et cree des tunnels |
| **Unne Server** (`unns`) | Application serveur qui accepte les connexions de tunnel et achemine le trafic |

## Comment ca fonctionne

```
Internet → Unne Server (votre VPS) → Multiplexage Yamux → Unne CLI → Service local
                                ↑
                    sous-domaine.votredomaine.com
```

1. Vous executez `unns` sur un VPS avec une IP publique et un domaine
2. Le DNS pour `*.votredomaine.com` pointe vers votre serveur
3. Vous executez `unne http 3000` sur votre machine locale
4. Unne CLI se connecte au serveur et etablit un tunnel multiplexe
5. Votre service local est maintenant accessible a `https://random.votredomaine.com`

## Fonctionnalites principales

- **Tunnels HTTP** avec sous-domaines personnalises ou generes automatiquement
- **Tunnels TCP** pour les bases de donnees, SSH et autres protocoles
- **Tableau de bord TUI** avec inspecteur de requetes style mitmproxy
- **Inspecteur web** avec interface style Console Reseau des Chrome DevTools
- **Gestion des utilisateurs** avec limites et quotas par utilisateur
- **Panneau d'administration** pour l'administration du serveur
- **Support proxy** (SOCKS5, HTTP CONNECT)
- **Pages d'avertissement** pour les premiers visiteurs (configurable)

## Protocole

Unne utilise [yamux](https://github.com/hashicorp/yamux) pour le multiplexage de plusieurs flux sur une seule connexion TCP. Cela permet une communication bidirectionnelle efficace entre le client et le serveur sans ouvrir plusieurs ports.

## Securite

- Les jetons sont stockes sous forme de hachages SHA-256 (jamais en texte clair)
- Les mots de passe administrateur utilisent bcrypt
- Restrictions de protocole et limites de trafic par utilisateur
- Pages d'avertissement du navigateur pour les premiers visiteurs
- Authentification administrateur basee sur les sessions
