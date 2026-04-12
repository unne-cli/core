# CLI Installation

## Download

Download the binary for your platform from [GitHub Releases](https://github.com/unne-cli/core/releases):

| File | Platform |
|------|----------|
| `unne-darwin-amd64` | macOS Intel |
| `unne-darwin-arm64` | macOS Apple Silicon |
| `unne-linux-amd64` | Linux x86_64 |
| `unne-linux-arm64` | Linux ARM64 |
| `unne-windows-amd64.exe` | Windows x64 |

### macOS / Linux

```bash
# Example: macOS Apple Silicon
curl -fsSL -o unne https://github.com/unne-cli/core/releases/download/latest/unne-darwin-arm64
chmod +x unne
sudo mv unne /usr/local/bin/
```

### Windows

Download `unne-windows-amd64.exe` and add it to your PATH.

## First-Time Setup

After installation, configure the CLI:

```bash
unne setup
```

This creates `~/.unne/settings.yml` with your server connection details:

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## Verify Connection

```bash
unne check
```

This confirms that the CLI can reach the Unne Server.
