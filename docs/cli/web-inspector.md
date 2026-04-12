# Web Inspector

The Web Inspector provides a Chrome DevTools Network Console-style interface for monitoring tunnel traffic in your browser.

## Enabling

```bash
# With quick tunnel
unne http 3000 --webui

# With custom port
unne http 3000 --webui --webui-port 9090

# In config
gui:
  webui: true
  webui_port: 4040
```

Open `http://localhost:4040` in your browser.

## Features

- **Request table** — Method, status, host, path, IP, duration, tunnel name
- **Request detail panel** — Resizable split panel with headers and body
- **Live updates** — Real-time via WebSocket
- **Filter** — Search by method, path, status, IP
- **Tunnel filter** — Show requests for a specific tunnel
- **Group by IP** — Toggle to group requests by client IP
- **JSON formatting** — Body is auto-formatted if it's valid JSON
- **Clear** — Reset the request list

## API Endpoints

The Web Inspector exposes a REST API:

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/api/requests` | List captured requests |
| `GET` | `/api/requests?tunnel=name` | Filter by tunnel |
| `GET` | `/api/requests/:id` | Get request details |
| `WS` | `/api/ws` | WebSocket for live updates |
