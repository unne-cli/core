# Inspecteur web

L'inspecteur web fournit une interface style Console Reseau des Chrome DevTools pour surveiller le trafic des tunnels dans votre navigateur.

## Activation

```bash
# Avec un tunnel rapide
unne http 3000 --webui

# Avec un port personnalise
unne http 3000 --webui --webui-port 9090

# Dans la configuration
gui:
  webui: true
  webui_port: 4040
```

Ouvrez `http://localhost:4040` dans votre navigateur.

## Fonctionnalites

- **Tableau des requetes** — Methode, statut, hote, chemin, IP, duree, nom du tunnel
- **Panneau de details des requetes** — Panneau divise redimensionnable avec en-tetes et corps
- **Mises a jour en direct** — En temps reel via WebSocket
- **Filtre** — Recherche par methode, chemin, statut, IP
- **Filtre par tunnel** — Afficher les requetes pour un tunnel specifique
- **Grouper par IP** — Basculer pour regrouper les requetes par IP client
- **Formatage JSON** — Le corps est automatiquement formate s'il s'agit d'un JSON valide
- **Effacer** — Reinitialiser la liste des requetes

## Points d'acces API

L'inspecteur web expose une API REST :

| Methode | Chemin | Description |
|---------|--------|-------------|
| `GET` | `/api/requests` | Lister les requetes capturees |
| `GET` | `/api/requests?tunnel=nom` | Filtrer par tunnel |
| `GET` | `/api/requests/:id` | Obtenir les details d'une requete |
| `WS` | `/api/ws` | WebSocket pour les mises a jour en direct |
