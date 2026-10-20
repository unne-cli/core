# Server Changelog

Changes to Unne Server (`unns`) and its admin panel. App changes: [App Changelog](/cli/changelog).

Update with `sudo unns update` (or **Update now** on the admin dashboard).

## v3.2.3 <Badge type="tip" text="latest" /> {#v3-2-3}

*2026-10-21*

- No server changes; released together with the app (same version number).

## v3.2.2 {#v3-2-2}

*2026-10-21*

- Fixed: `unns` 3.2.1 reported itself as 3.2.0, so `unns update` kept offering the same update. The server and the app now share one version number.
- `unns update` checks that the downloaded file runs and reports the expected version before replacing the binary.
- The admin language switch no longer gets stuck when the address contains `?lang=`.

## v3.2.1 {#v3-2-1}

*2026-10-20*

- **Russian language** in the admin panel, the sign-in page and the user portal (follows the browser; switch with **RU / EN**).

## v3.2.0 {#v3-2-0}

*2026-10-20*

- The admin panel uses the Unne gradient logo, also as the favicon.

## v3.1.0 {#v3-1-0}

*2026-10-20*

- **Tunnel types on/off**: HTTP and TCP can be switched off separately, server-wide (*Settings → Tunnel types*) and per user. Switching a type off disconnects live tunnels of that type immediately.
- **Self-update**: `unns update` downloads the latest release, replaces the binary and restarts the systemd service. Admins see an **Update now** banner on the dashboard.
- **Safe database upgrades**: the schema is versioned; before an upgrade changes it, the server writes a backup next to the database (`unne.db.bak-v<old>-<date>`). Migrations only add tables and columns.
- New `unns version` command.
- Partial settings updates through the API no longer reset the fields you leave out.

## v3.0.0 {#v3-0-0}

*2026-10-19*

### Admin panel (redesigned)
- New design with light and dark themes, a sidebar and page-based navigation; forms open as side sheets or pages.
- **Real time**: tunnels appear and disappear instantly (Server-Sent Events).
- One **dashboard** with live tunnels, traffic and per-user statistics.
- **User pages**: overview, general & limits, devices & tokens (host, OS, client version, IP), domains and TCP ports. A searchable user picker replaces long selects.
- **Reserved TCP ports**, alongside reserved subdomains.
- **User portal**: users sign in to see their tokens, devices, reservations and live tunnels, and create their own tokens up to their device limit.

### Limits
- Server-wide defaults and per-user overrides for **max session duration**, **simultaneous tunnels** and **devices**.
- **One token = one device**: a token binds to the first device that uses it; an admin can unbind it.
- Per-user switches for custom `--subdomain` / `--remote-port` (otherwise only reservations, or a random address).
- **Auto reservations**: new users automatically get N subdomains and M TCP ports.

### Other
- `unns` with no arguments shows help instead of starting a second server.

## v2.0.1 {#v2-0-1}

*2026-04-13*

- Generated tokens stay visible in the admin panel until you navigate away.
- Traffic period can be reset to "No limit".
- Fixed random TCP port generation colliding with ports in use.

## v2.0.0 {#v2-0-0}

*2026-04-12*

A full rewrite as `unns`.

- SQLite storage, users and tokens.
- Per-user limits: tunnels, devices, protocols, traffic per day, month or quarter.
- Reserved subdomains; subdomain formats (random, factory, ULID, UUID).
- Custom error and warning pages.
- First **admin panel**.

## v1.0 {#v1-0}

*2026-02-06*

First prototype: a minimal yamux tunnel server for HTTP tunnels.
