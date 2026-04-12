# Demarrage rapide

## Prerequis

- Un VPS ou serveur avec une adresse IP publique
- Un domaine avec un DNS wildcard configure (`*.votredomaine.com → IP du serveur`)

## Installation rapide

### 1. Configurer le serveur

Sur votre VPS :

```bash
# Installation en une ligne (detecte automatiquement l'OS/architecture, lance la configuration)
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

Ou telechargez manuellement depuis les [Releases GitHub](https://github.com/unne-cli/core/releases).

L'assistant de configuration vous demandera :
- Le domaine du serveur (ex. `tunnel.example.com`)
- Le port de controle (par defaut : `8222`)
- Le port du proxy HTTP (par defaut : `8223`)
- Les parametres du panneau d'administration
- Les identifiants administrateur

### 2. Configurer le DNS

Pointez un enregistrement DNS wildcard vers votre serveur :

```
*.tunnel.example.com → VOTRE_IP_SERVEUR
```

### 3. Installer le CLI

Sur votre machine locale — telechargez depuis les [Releases](https://github.com/unne-cli/core/releases), puis :

```bash
# Configurer le client
unne setup
```

Entrez l'adresse de votre serveur, le port et le jeton d'authentification lorsque demande.

### 4. Creer votre premier tunnel

```bash
# Demarrer un serveur web local (exemple)
python3 -m http.server 8080

# Dans un autre terminal, creer un tunnel
unne http 8080
```

Votre serveur local est maintenant accessible a `https://random.tunnel.example.com`.

## Et ensuite ?

- [Configuration du CLI](/fr/cli/configuration) — En savoir plus sur les fichiers de configuration `unne.yml`
- [Tunnels HTTP](/fr/cli/http-tunnels) — Sous-domaines personnalises, tunnels multiples
- [Tunnels TCP](/fr/cli/tcp-tunnels) — Tunnels pour bases de donnees et SSH
- [Configuration du serveur](/fr/server/setup) — Configuration detaillee du serveur
- [Gestion des utilisateurs](/fr/server/users) — Creation d'utilisateurs et definition des limites
