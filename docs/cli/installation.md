# CLI Installation

## Quick Install

### macOS / Linux

```bash
curl -fsSL https://unne.site/cli/install | bash
```

### Windows (PowerShell)

```powershell
irm https://unne.site/cli/install.ps1 | iex
```

## Manual Download

Download the binary for your platform from [GitHub Releases](https://github.com/unne-cli/core/releases):

| File | Platform |
|------|----------|
| `unne-darwin-amd64` | macOS Intel |
| `unne-darwin-arm64` | macOS Apple Silicon |
| `unne-linux-amd64` | Linux x86_64 |
| `unne-linux-arm64` | Linux ARM64 |
| `unne-windows-amd64.exe` | Windows x64 |

### macOS / Linux (manual)

```bash
# Example: macOS Apple Silicon
curl -fsSL -o unne https://github.com/unne-cli/core/releases/download/latest/unne-darwin-arm64
chmod +x unne
sudo mv unne /usr/local/bin/
```

### Windows (manual)

Download `unne-windows-amd64.exe` and add it to your PATH.

## First-Time Setup

After installation, configure the CLI:

```bash
unne setup
```

This creates `~/.unne/settings.yml` with your server connection details:

```yaml
server: "unne.site"
port: 8222
authtoken: "your-auth-token"
```

## Verify Connection

```bash
unne check
```

This confirms that the CLI can reach the Unne Server.

## Usage

```
Unne CLI v2.0.1 - Self-hosted tunnel solution

Usage:
  unne setup                        Configure server connection
  unne http <port>                  Quick HTTP tunnel
  unne tcp <port>                   Quick TCP tunnel
  unne start                        Start tunnels from unne.yml
  unne domains                      List your reserved subdomains
  unne check                        Check server connectivity
  unne update                       Check for updates
  unne version                      Show version

Options:
  --config, -c <path>               Config file path (default: unne.yml)
  --subdomain, --domain, -s <name>  Desired subdomain (http only)
  --remote-port, -rp <port>         Remote port (tcp only)
  --proxy, -p <url>                 Proxy URL (socks5:// or http://)
  --skip-warning, --sw              Skip browser warning page
  --no-tui                          Disable TUI, log-only mode
  --webui, -w                       Enable web inspector
  --webui-port, -wp <port>          Web inspector port (default: 4040)
```
