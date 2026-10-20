# Unne App

The Unne app runs on your computer and connects your local services to your Unne Server. It's one program you can use two ways:

- **Desktop app** — open Unne like any other app: a tray / menu bar icon and a window to create, start and inspect tunnels. Setup and installation happen inside the app. See [Desktop App](/cli/desktop).
- **Command line** — the same `unne` binary in a terminal: quick tunnels, scripts, servers without a screen.

Both share the same settings (`~/.unne`), saved tunnels and background service, so you can switch between them at any time.

## Install

| | |
|---|---|
| Desktop app | [macOS](https://github.com/unne-cli/core/releases/latest/download/Unne-macOS.zip) · [Windows x64](https://github.com/unne-cli/core/releases/latest/download/unne-app-windows-amd64.exe) · [Windows ARM](https://github.com/unne-cli/core/releases/latest/download/unne-app-windows-arm64.exe) |
| Command line (macOS / Linux) | `curl -fsSL https://unne.site/cli/install \| bash` |
| Command line (Windows) | `irm https://unne.site/cli/install.ps1 \| iex` |

More: [Installation](/cli/installation).

## Commands

| Command | Description |
|---------|-------------|
| `unne app` | Start the desktop app (tray icon + window) |
| `unne app install` / `uninstall` | Add / remove Unne in Applications or the Start menu |
| `unne ui` | Open the web interface in the browser |
| `unne setup` | Interactive first-time configuration (the app does this on first launch) |
| `unne http <port>` | Quick HTTP tunnel on a local port |
| `unne tcp <port>` | Quick TCP tunnel on a local port |
| `unne start` | Start tunnels defined in `unne.yml` |
| `unne service install` | Run tunnels in the background from computer start-up |
| `unne update` | Update to the latest version |
| `unne check` | Verify server connectivity |
| `unne version` | Show version info |
| `unne help` | Show help |

## Global Flags

| Flag | Description |
|------|-------------|
| `--config <path>` | Path to config file (default: `unne.yml`) |
| `--subdomain <name>` | Desired subdomain (HTTP only) |
| `--remote-port <port>` | Remote port (TCP only) |
| `--proxy <url>` | Proxy URL (`socks5://` or `http://`) |
| `--skip-warning`, `--sw` | Skip browser warning page |
| `--no-tui` | Disable TUI, use log-only output |
| `--webui` | Enable web inspector |
| `--webui-port <port>` | Web inspector port (default: `4040`) |

## Quick Examples

```bash
# Expose a local web app
unne http 3000

# Expose with a custom subdomain
unne http 3000 --subdomain myapp

# TCP tunnel for PostgreSQL
unne tcp 5432 --remote-port 15432

# Start all tunnels from config with web inspector
unne start --webui

# Headless mode through a proxy
unne http 8080 --no-tui --proxy socks5://127.0.0.1:1080
```

Changes by version: [App Changelog](/cli/changelog).
