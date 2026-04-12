# Pages d'erreur

Unne Server affiche des pages d'erreur stylisees aux visiteurs via navigateur lorsque quelque chose ne fonctionne pas.

## Types de pages

### Page d'avertissement (200)

Affichee lors de la premiere visite via navigateur sur un tunnel. Demande au visiteur de confirmer qu'il souhaite continuer.

**Options de contournement :**
- Cookie `unne_confirmed_<sous-domaine>=1` (defini automatiquement apres confirmation, dure 24h)
- En-tete `X-Unne-Skip-Warning: 1`
- User-Agent non-navigateur (clients API, curl, etc.)
- Option client `--skip-warning` (si l'utilisateur a la permission `skip_warning`)

### Non trouve (404)

Affichee lorsqu'un sous-domaine n'a pas de tunnel actif. Inclut :
- Le code d'erreur `ERR_UNNE_404`
- La commande CLI pour corriger le probleme
- Un bouton d'actualisation

### Hors ligne (502)

Affichee lorsqu'un tunnel est enregistre mais que le service en amont est inaccessible. Cela signifie :
- Le client CLI est connecte au serveur
- Mais le service local ne fonctionne pas ou ne repond pas

### Erreur generique

Affichee pour les autres erreurs avec un code d'erreur et un message personnalises.

## Design

Toutes les pages utilisent un design inspire de shadcn :
- Fond blanc epure
- Composant d'alerte avec bordure gauche coloree (rouge pour les erreurs, ambre pour les avertissements)
- Icones Lucide
- Badge d'identifiant de requete pour le debogage
- Mise en page responsive

## Personnalisation

Les modeles de pages d'erreur sont integres dans le binaire du serveur dans `internal/server/pages/`. Pour personnaliser :

1. Forkez le depot
2. Modifiez les modeles HTML dans `internal/server/pages/`
3. Modifiez les styles dans `internal/server/pages/base.css`
4. Recompilez le binaire du serveur

Le CSS et le HTML sont integres via `embed.FS` de Go — aucune dependance externe a l'execution.
