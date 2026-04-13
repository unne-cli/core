# HTTP Tunnels

HTTP tunnels expose a local HTTP service through a public subdomain on your Unne Server.

## Quick Tunnel

```bash
unne http 3000
```

This creates a tunnel with an auto-generated subdomain like `a8f3k2m1.unne.site`.

## Custom Subdomain

```bash
unne http 3000 --subdomain myapp
```

Your service will be at `myapp.unne.site`.

## From Config File

In `unne.yml`:

```yaml
tunnels:
  - name: frontend
    protocol: http
    subdomain: app
    upstream: localhost:3000

  - name: api
    protocol: http
    subdomain: api
    upstream: localhost:8080
```

Start all tunnels:

```bash
unne start
```

## Multiple Tunnels

When running multiple tunnels, the TUI shows tabs for each tunnel (pm2-style). Use `Tab`/`Shift+Tab` to switch between them.

## Skip Browser Warning

By default, first-time browser visitors see a confirmation page. To skip it (if your account has permission):

```bash
unne http 3000 --skip-warning
```

Or in config:

```yaml
skip_warning: true
```

## Request Inspection

Every HTTP request/response flowing through the tunnel is captured for inspection:
- **TUI**: Press `Enter` on a request to see headers and body
- **Web Inspector**: Add `--webui` flag, then open `http://localhost:4040`
