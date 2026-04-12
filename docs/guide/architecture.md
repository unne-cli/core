# Architecture

## System Overview

```
┌─────────────────┐         ┌──────────────────────────┐
│   Unne CLI      │         │     Unne Server          │
│                 │   TCP   │                          │
│  Local Service  │◄───────►│  Control Plane (:8222)   │
│  TUI Dashboard  │  yamux  │  HTTP Proxy    (:8223)   │
│  Web Inspector  │         │  Admin Panel   (:4041)   │
│                 │         │  TCP Listeners (dynamic) │
└─────────────────┘         └──────────────────────────┘
```

## Connection Flow

### Handshake (v2)

```
Client → Server:
  UNNE_HANDSHAKE:v2
  TOKEN:<auth_token>
  PROTOCOL:<http|tcp>
  SUBDOMAIN:<name>           # for HTTP
  REMOTE_PORT:<port>         # for TCP
  SKIP_WARNING:1             # optional

Server → Client:
  UNNE_READY:<subdomain>     # HTTP success
  UNNE_READY_TCP:<port>      # TCP success
  STATUS_UNNE_*              # error codes
```

### HTTP Request Flow

```
Browser → Server:8223 → Extract subdomain from Host header
  → Lookup yamux session → Open stream → Forward to client
  → Client forwards to localhost:PORT → Response travels back
```

### TCP Request Flow

```
TCP Client → Server:REMOTE_PORT → Open yamux stream
  → Forward to client → Client forwards to localhost:PORT
  → Bidirectional raw TCP forwarding
```

## Data Storage

| Component | Storage | Purpose |
|-----------|---------|---------|
| Server | SQLite (`unne.db`) | Users, tokens, sessions, traffic logs |
| Server | YAML (`config.yml`) | Server configuration |
| Client | YAML (`~/.unne/settings.yml`) | Global client settings |
| Client | YAML (`unne.yml`) | Project-local tunnel config |
| Client | In-memory ring buffer | Captured HTTP exchanges |

## Project Structure

```
cmd/
  unne/main.go              # CLI client entry point
  unns/main.go       # Server entry point
internal/
  config/                   # Client configuration
  tunnel/                   # Tunnel client + HTTP capture
  tui/                      # BubbleTea terminal UI
  webui/                    # Client-side web inspector
  proxy/                    # SOCKS5/HTTP proxy dialer
  server/                   # Server core + HTTP handler
  store/                    # SQLite data layer
  admin/                    # Admin panel WebUI
  setup/                    # Server setup wizard + config CLI
```
