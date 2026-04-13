# TCP Tunnels

TCP tunnels forward raw TCP traffic, suitable for databases, SSH, game servers, and other non-HTTP protocols.

## Quick Tunnel

```bash
# Expose local PostgreSQL
unne tcp 5432 --remote-port 15432
```

This makes your local PostgreSQL available at `unne.site:15432`.

## From Config

```yaml
tunnels:
  - name: database
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432

  - name: ssh
    protocol: tcp
    remote_port: 2222
    upstream: localhost:22
```

## Connecting to TCP Tunnels

```bash
# PostgreSQL
psql -h unne.site -p 15432 -U myuser mydb

# SSH
ssh -p 2222 user@unne.site

# MySQL
mysql -h unne.site -P 13306 -u root
```

## Differences from HTTP Tunnels

| Feature | HTTP | TCP |
|---------|------|-----|
| Routing | Subdomain-based | Port-based |
| Request inspection | Full headers + body | Connection metadata only |
| Warning page | Yes (configurable) | No |
| Protocol parsing | HTTP-aware | Raw bytes |

## Port Range

Remote ports must be between `1024` and `65535`. Ports below 1024 are reserved.

If the requested port is already in use, you'll receive `STATUS_UNNE_PORT_UNAVAILABLE`.
