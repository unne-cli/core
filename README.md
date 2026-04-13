# Unne

Self-hosted tunnel solution — expose local services to the internet through your own server.

## Quick Install (Server)

```bash
curl -fsSL https://unne.site/server/install | sudo bash
```

## Download (CLI)

Download from [Releases](https://github.com/unne-cli/core/releases) for your platform.

| Binary | Platform |
|--------|----------|
| `unne-darwin-arm64` | macOS Apple Silicon |
| `unne-darwin-amd64` | macOS Intel |
| `unne-linux-amd64` | Linux x86_64 |
| `unne-linux-arm64` | Linux ARM64 |
| `unne-windows-amd64.exe` | Windows x64 |
| `unns-linux-amd64` | Server Linux x86_64 |
| `unns-linux-arm64` | Server Linux ARM64 |

## Usage

```bash
# Client: expose local port
unne http 3000
unne http 3000 -s myapp
unne tcp 5432 -rp 15432

# Server: manage
unns setup
unns config list
unns user create john secret
unns token gen 1 macbook
```

## Features

- HTTP & TCP tunnels with yamux multiplexing
- TUI dashboard with request inspector (mitmproxy-style)
- Web inspector (Chrome DevTools Network style)
- User management with per-user limits
- Admin panel WebUI
- Reserved subdomains
- Proxy support (SOCKS5, HTTP)

## Documentation

[docs.unne.dev](https://github.com/unne-cli/core/tree/main/docs) — available in 7 languages.

## Contributing

See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for translation and documentation contributions.

## License

MIT
