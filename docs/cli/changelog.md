# App Changelog

Changes to the Unne app — the desktop app, `unne ui` and the `unne` command line. Server changes: [Server Changelog](/server/changelog).

Update with `unne update` (or **Update now** in the app).

## v3.2.1 <Badge type="tip" text="latest" /> {#v3-2-1}

*2026-10-20*

- **Unne is a regular app.** Download **Unne.app** (macOS) or **unne-app-windows-*.exe** (Windows) and open it — no terminal needed. It starts in the tray / menu bar and opens its window. See [Desktop App](/cli/desktop).
- When neither the background service nor `unne ui` is running, the app runs the tunnels itself on a **random local port**; otherwise it connects to the running one.
- **Setup in the app**: the first launch asks for the server, port and token and checks them before saving. Change them later in **Settings → Connection** (`unne setup` still works).
- **Install from the app**: *Settings → Unne app* installs Unne into Applications / the Start menu, lists it under *Settings → Apps* on Windows, opens it at login and can add the `unne` command to the terminal. Uninstall from the same place or with `unne app uninstall`.
- The Windows app has its own icon and no console window.
- **Russian language** in `unne ui`, the app window and the tray menu (follows the system; switch with **RU / EN**).
- `~/.unne/settings.yml`, which holds your token, is now readable by you only.

## v3.2.0 {#v3-2-0}

*2026-10-20*

- **Tray / menu bar icon** (`unne tray`): shows how many tunnels are online and lets you start, stop and copy each tunnel's address.
- **Native window** (`unne window`): WKWebView on macOS, WebView2 on Windows, a Chromium app window on Linux.
- `unne tray install` adds Unne to your apps and starts the icon at login.
- `unne ui` uses the Unne gradient logo, also as the favicon.

## v3.1.0 {#v3-1-0}

*2026-10-20*

- **Background service**: `unne service install|uninstall|status|restart` — a Windows service, a systemd user unit (with lingering) or a launchd agent. See [Autostart](/cli/autostart).
- **Autostart tunnels**: mark tunnels **Start automatically** (or `autostart: true` in `~/.unne/tunnels.yml`); they connect as soon as Unne starts. New **Startup** page in `unne ui`.
- **Self-update**: `unne update` downloads and installs the latest release and restarts the background service; `--check` only checks. `unne ui` shows **Update now**.
- Running `unne ui` while the service runs opens the existing UI instead of failing on a busy port.
- Downloads are verified against `checksums.txt`.
- Install scripts fetch the **latest** release by default (pin one with `UNNE_VERSION`).
- Fixed: `unne update` printed a link to an install script that no longer exists.

## v3.0.0 {#v3-0-0}

*2026-10-19*

- **`unne ui`**: a local web app to create, start and stop tunnels, inspect traffic live and see your reservations and limits.
- A tunnel killed by the admin, or one that reaches its session limit, now stops the client instead of reconnecting on a new subdomain.
- The client reports its device ID, host name, OS and version (used for one-token-per-device).
- Windows `install.ps1` rewritten: fixed a parse error, TLS 1.2, correct architecture detection, atomic download.

## v2.0.1 {#v2-0-1}

*2026-04-13*

- Removed the `setlang` command.

## v2.0.0 {#v2-0-0}

*2026-04-12*

A full rewrite of the client.

- HTTP and TCP tunnels over one multiplexed connection (yamux).
- **TUI dashboard** with a request inspector (mitmproxy-style).
- **Web inspector** (`--webui`), in the style of the Chrome DevTools Network tab.
- `unne.yml` project config for several tunnels at once; `unne setup`, `check` and `domains` commands.
- Proxy support (SOCKS5 / HTTP).
- Installers for macOS, Linux and Windows.

## v1.0 {#v1-0}

*2026-02-06*

First prototype: `unne auth <token>` and `unne http <port> [-s subdomain]`, HTTP tunnels only.
