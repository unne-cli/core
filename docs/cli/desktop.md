# Desktop App (Tray & Window)

Unne is also a regular desktop app: an icon in the macOS menu bar or the Windows / Linux system tray, plus a native window with the same interface as `unne ui`.

## Install

| OS | Download | |
|----|----------|--|
| macOS | [Unne-macOS.zip](https://github.com/unne-cli/core/releases/latest/download/Unne-macOS.zip) | Unzip and open **Unne.app** |
| Windows (x64) | [unne-app-windows-amd64.exe](https://github.com/unne-cli/core/releases/latest/download/unne-app-windows-amd64.exe) | Run it |
| Windows (ARM) | [unne-app-windows-arm64.exe](https://github.com/unne-cli/core/releases/latest/download/unne-app-windows-arm64.exe) | Run it |
| Linux | install the CLI, then `unne app install` | Adds Unne to the app menu |

On first launch Unne asks for your **server, port and token** and checks the connection. Then it offers to **install itself**:

- **macOS** — copies Unne.app to *Applications* (Launchpad, Spotlight).
- **Windows** — installs into `%LOCALAPPDATA%\Programs\Unne` (no administrator rights), adds a Start menu entry and lists Unne under *Settings → Apps* for uninstalling.
- Optionally: **Open at login** and the **`unne` command** in the terminal.

Everything can be changed later in **Settings** inside the app.

::: warning Unsigned app
The app isn't code-signed yet. macOS: right-click Unne.app → **Open** the first time (or *System Settings → Privacy & Security → Open Anyway*). Windows SmartScreen: **More info → Run anyway**.
:::

## How it runs

Opening the app starts the tray icon and the window:

- If the [background service](/cli/autostart) or `unne ui` is already running, the app connects to it.
- Otherwise the app runs your tunnels itself on a random local port. Quitting the tray stops them.

## Commands

```bash
unne app             # start the app (tray + window)
unne app install     # install the app (add --cli for the terminal command)
unne app uninstall
unne tray            # only the tray icon
unne window          # only the window
```

## Tray menu

- **Unne · 2 of 3 online** — how many tunnels are connected.
- **Open Unne** — opens the native window (on Windows a left click on the icon does the same).
- One entry per tunnel (🟢 online, 🟡 connecting, 🔴 error, ⚪ stopped) with **Start / Stop**, **Copy address** and **Open in browser**.
- **Open in browser**, **Launch at login**, **Quit**.

The icon turns blue while at least one tunnel is online.

## Where tunnels run

If the [background service](/cli/autostart) is installed, the tray and window only control it: quitting the tray leaves your tunnels running. Without the service, the tray runs the tunnels itself and **Quit** stops them.

## Native window

| OS | Window |
|----|--------|
| macOS | Native window (WKWebView) |
| Windows | Native window (Microsoft Edge WebView2, included in Windows 10/11) |
| Linux | App window of Chrome, Chromium, Edge or Brave (no tabs or address bar), otherwise your default browser |

## Language

The app, `unne ui` and the admin panel are available in English and Russian. The language follows your system / browser; switch it with the **RU / EN** button in the top bar.
