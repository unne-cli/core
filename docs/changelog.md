# Changelog

All notable changes to Unne CLI (`unne`) and Unne Server (`unns`). Releases: [GitHub](https://github.com/unne-cli/core/releases).

Update with `unne update` and `sudo unns update`.

## v3.2.0 <Badge type="tip" text="latest" /> {#v3-2-0}

*2026-10-20*

### Desktop app
- **Tray / menu bar icon** (`unne tray`): shows how many tunnels are online and lets you start, stop and copy each tunnel's address. It uses the background service when it's installed and otherwise runs the tunnels itself.
- **Native window** (`unne window`): the `unne ui` interface in its own window — WKWebView on macOS, WebView2 on Windows, a Chromium app window on Linux.
- `unne tray install` adds **Unne** to Applications / the Start menu / the app menu and starts the icon at login. See [Desktop App](/cli/desktop).

### Look
- The admin panel and `unne ui` use the Unne gradient logo, also as the favicon.

## v3.1.0 {#v3-1-0}

*2026-10-20*

### Server & admin panel
- **Tunnel types on/off**: HTTP and TCP can be switched off separately, both server-wide (*Settings → Tunnel types*) and per user. Turning a type off disconnects live tunnels of that type immediately.
- **Self-update**: `unns update` downloads the latest release, replaces the binary and restarts the systemd service. Admins see an **Update now** banner on the dashboard.
- **Safe database upgrades**: the schema is now versioned. Before an upgrade changes it, the server writes a backup next to the database (`unne.db.bak-v<old>-<date>`). Migrations only add tables and columns, so existing data stays as it is.
- New `unns version` command.
- Partial settings updates through the API no longer reset the fields you leave out.

### CLI
- **Background service**: `unne service install|uninstall|status|restart`. Unne runs at start-up as a Windows service, a systemd user unit (with lingering) or a launchd agent. See [Autostart](/cli/autostart).
- **Autostart tunnels**: mark tunnels **Start automatically** in `unne ui` (or `autostart: true` in `~/.unne/tunnels.yml`). They connect as soon as Unne starts.
- `unne ui` has a new **Startup** page for the service and autostart toggles.
- **Self-update**: `unne update` downloads and installs the latest release and restarts the background service. `unne update --check` only checks. `unne ui` shows an **Update now** banner.
- Running `unne ui` while the background service is running opens the existing UI instead of failing on a busy port.
- Downloads are verified against `checksums.txt` when the release has one.

### Installers
- Install scripts now fetch the **latest** release by default; pin one with `UNNE_VERSION=v3.1.0`.
- Fixed: `unne update` used to print a link to an old install script that no longer exists.

## v3.0.0 {#v3-0-0}

*2026-10-19*

### Admin panel (redesigned)
- New design with light and dark themes, a sidebar and page-based navigation (no more stacked modals). Forms open as right-side sheets or full pages.
- **Real time**: new and closed tunnels appear instantly, over Server-Sent Events.
- One **dashboard** with live tunnels, traffic and per-user statistics.
- **User pages** with tabs: overview, general & limits, devices & tokens (with device host, OS, client version and IP), domains and TCP ports. A searchable user picker replaces long selects.
- **Reserved TCP ports**, alongside reserved subdomains.
- **User portal**: every user can sign in to see their tokens, devices, reservations and live tunnels, and create their own tokens up to their device limit.

### Limits
- Server-wide defaults and per-user overrides for **max session duration**, **simultaneous tunnels** and **devices**.
- **One token = one device**: a token binds to the first device that uses it. An admin can unbind it.
- Per-user switches for custom `--subdomain` / `--remote-port`. When off, only the user's reservations work and anything else gets a random address.
- **Auto reservations**: new users automatically get N subdomains (in the server's subdomain format) and M TCP ports.

### CLI
- **`unne ui`**: a local web app to create, start and stop tunnels, inspect traffic live and see your reservations and limits.
- Killing a tunnel from the admin panel or reaching the session limit now stops the client instead of letting it reconnect on a new subdomain.
- The client reports its device ID, host name, OS and version.

### Server
- `unns` with no arguments shows help instead of starting a second server (which failed with "address already in use").

### Installers
- Windows `install.ps1` rewritten: it fixes a parse error, enables TLS 1.2, detects the architecture correctly, downloads atomically and handles errors safely.

## v2.0.1 {#v2-0-1}

*2026-04-13*

- Generated tokens stay visible in the admin panel until you navigate away.
- Traffic period can be reset to "No limit".
- Fixed random TCP port generation (ports collided with ports already in use).
- Removed the `setlang` command; error and warning pages are in English.

## v2.0.0 {#v2-0-0}

*2026-04-12*

A full rewrite into two binaries: `unne` (client) and `unns` (server).

- HTTP and TCP tunnels over a single multiplexed connection (yamux).
- **TUI dashboard** with a request inspector (mitmproxy-style).
- **Web inspector** (`--webui`), in the style of the Chrome DevTools Network tab.
- `unne.yml` project config for several tunnels at once; `unne setup`, `check` and `domains` commands.
- Proxy support (SOCKS5 / HTTP) for the client connection.
- Server: SQLite storage, users and tokens, per-user limits (tunnels, devices, protocols, traffic per day, month or quarter), reserved subdomains, subdomain formats (random, factory, ULID, UUID) and custom error and warning pages.
- First **admin panel** web UI.
- Installers for macOS, Linux and Windows, and the documentation site.

## v1.0 {#v1-0}

*2026-02-06*

First prototype: a single `unne` binary with `unne auth <token>` and `unne http <port> [-s subdomain]`, a minimal yamux tunnel server and HTTP tunnels only.
