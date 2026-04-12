# TUI Dashboard

Unne CLI includes a built-in terminal UI powered by [BubbleTea](https://github.com/charmbracelet/bubbletea).

## Layout

```
┌─────────────────────────────────────────────────────┐
│ UNNE TUNNEL  v2.0.0              ● ONLINE           │
│━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━│
│ ● web-app (12)  │  ○ api (3)  │  ◌ database        │
│─────────────────────────────────────────────────────│
│ #     Method  Path              Status    Time      │
│ ─────────────────────────────────────────────────── │
│ 1     GET     /api/users        200       12ms      │
│ 2     POST    /api/login        201       45ms      │
│ 3     GET     /static/app.js    304       2ms       │
│►4     DELETE  /api/users/5      500       120ms     │
│                                                     │
│ ↑↓ navigate  enter details  esc back  v split  q quit│
└─────────────────────────────────────────────────────┘
```

## Key Bindings

| Key | Action |
|-----|--------|
| `↑` / `k` | Move up in request list |
| `↓` / `j` | Move down in request list |
| `Tab` | Next tunnel tab |
| `Shift+Tab` | Previous tunnel tab |
| `Enter` | View request details / toggle Request↔Response |
| `Esc` | Back to list / close detail panel |
| `v` | Toggle vertical/horizontal split |
| `q` / `Ctrl+C` | Quit |

## Multi-Tunnel Tabs

When running multiple tunnels (via `unne start`), each tunnel gets its own tab showing:
- Connection status indicator (`●` connected, `◌` connecting, `○` offline)
- Tunnel name and request count
- Independent request list

## Request Detail View

Press `Enter` on a request to see:
- **Request tab**: Method, path, host, headers, body
- **Response tab**: Status code, duration, headers, body

Toggle between Request and Response with `Enter`.

## Split View

Press `v` to toggle between:
- **Vertical split**: Request list on the left, details on the right
- **Horizontal split**: Request list on top, details on the bottom

## Disabling TUI

For headless/CI environments:

```bash
unne start --no-tui
```

Logs are printed to stdout in plain text format.
