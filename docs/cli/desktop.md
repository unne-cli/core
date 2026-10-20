# Desktop App (Tray & Window)

`unne` doubles as a small desktop app: an icon in the macOS menu bar or the Windows / Linux system tray, plus a native window with the same interface as `unne ui`.

```bash
unne tray            # show the tray / menu bar icon
unne window          # open the Unne window
unne tray install    # add "Unne" to your apps and start the icon at login
unne tray uninstall
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

## App shortcut

`unne tray install` creates:

- **macOS** — `~/Applications/Unne.app` (Launchpad, Spotlight, Dock) and a login item.
- **Windows** — a Start menu shortcut and an entry under *Startup apps*.
- **Linux** — `~/.local/share/applications/unne.desktop` and `~/.config/autostart/unne.desktop`.

Opening the app starts the tray icon and shows the window.
