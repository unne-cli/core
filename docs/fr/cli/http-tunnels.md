# Tunnels HTTP

Les tunnels HTTP exposent un service HTTP local via un sous-domaine public sur votre serveur Unne.

## Tunnel rapide

```bash
unne http 3000
```

Cela cree un tunnel avec un sous-domaine genere automatiquement comme `a8f3k2m1.tunnel.example.com`.

## Sous-domaine personnalise

```bash
unne http 3000 --subdomain monapp
```

Votre service sera accessible a `monapp.tunnel.example.com`.

## Depuis un fichier de configuration

Dans `unne.yml` :

```yaml
tunnels:
  - name: frontend
    protocol: http
    subdomain: app
    upstream: localhost:3000

  - name: api
    protocol: http
    subdomain: api
    upstream: localhost:8080
```

Demarrer tous les tunnels :

```bash
unne start
```

## Tunnels multiples

Lors de l'execution de plusieurs tunnels, le TUI affiche des onglets pour chaque tunnel (style pm2). Utilisez `Tab`/`Shift+Tab` pour passer de l'un a l'autre.

## Ignorer l'avertissement du navigateur

Par defaut, les premiers visiteurs via navigateur voient une page de confirmation. Pour l'ignorer (si votre compte en a la permission) :

```bash
unne http 3000 --skip-warning
```

Ou dans la configuration :

```yaml
skip_warning: true
```

## Inspection des requetes

Chaque requete/reponse HTTP transitant par le tunnel est capturee pour inspection :
- **TUI** : Appuyez sur `Entree` sur une requete pour voir les en-tetes et le corps
- **Inspecteur web** : Ajoutez l'option `--webui`, puis ouvrez `http://localhost:4040`
