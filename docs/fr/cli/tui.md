# Tableau de bord TUI

Unne CLI inclut une interface terminal integree propulsee par [BubbleTea](https://github.com/charmbracelet/bubbletea).

## Disposition

```
┌─────────────────────────────────────────────────────┐
│ UNNE TUNNEL  v2.0.0              ● EN LIGNE         │
│━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━│
│ ● web-app (12)  │  ○ api (3)  │  ◌ database        │
│─────────────────────────────────────────────────────│
│ #     Methode  Chemin            Statut    Duree    │
│ ─────────────────────────────────────────────────── │
│ 1     GET     /api/users        200       12ms      │
│ 2     POST    /api/login        201       45ms      │
│ 3     GET     /static/app.js    304       2ms       │
│►4     DELETE  /api/users/5      500       120ms     │
│                                                     │
│ ↑↓ naviguer  entree details  esc retour  v diviser  q quitter│
└─────────────────────────────────────────────────────┘
```

## Raccourcis clavier

| Touche | Action |
|--------|--------|
| `↑` / `k` | Monter dans la liste des requetes |
| `↓` / `j` | Descendre dans la liste des requetes |
| `Tab` | Onglet de tunnel suivant |
| `Shift+Tab` | Onglet de tunnel precedent |
| `Entree` | Voir les details de la requete / basculer Requete↔Reponse |
| `Esc` | Retour a la liste / fermer le panneau de details |
| `v` | Basculer entre vue verticale/horizontale |
| `q` / `Ctrl+C` | Quitter |

## Onglets multi-tunnels

Lors de l'execution de plusieurs tunnels (via `unne start`), chaque tunnel obtient son propre onglet affichant :
- L'indicateur d'etat de connexion (`●` connecte, `◌` en connexion, `○` hors ligne)
- Le nom du tunnel et le nombre de requetes
- Une liste de requetes independante

## Vue detaillee des requetes

Appuyez sur `Entree` sur une requete pour voir :
- **Onglet Requete** : Methode, chemin, hote, en-tetes, corps
- **Onglet Reponse** : Code de statut, duree, en-tetes, corps

Basculez entre Requete et Reponse avec `Entree`.

## Vue divisee

Appuyez sur `v` pour basculer entre :
- **Division verticale** : Liste des requetes a gauche, details a droite
- **Division horizontale** : Liste des requetes en haut, details en bas

## Desactiver le TUI

Pour les environnements headless/CI :

```bash
unne start --no-tui
```

Les journaux sont affiches sur stdout en format texte brut.
