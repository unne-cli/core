# CLI орнату

## Жүктеп алу

Платформаңызға сәйкес бинарлық файлды [GitHub Releases](https://github.com/unne-cli/core/releases) бетінен жүктеп алыңыз:

| Файл | Платформа |
|------|-----------|
| `unne-darwin-amd64` | macOS Intel |
| `unne-darwin-arm64` | macOS Apple Silicon |
| `unne-linux-amd64` | Linux x86_64 |
| `unne-linux-arm64` | Linux ARM64 |
| `unne-windows-amd64.exe` | Windows x64 |

### macOS / Linux

```bash
# Мысал: macOS Apple Silicon
curl -fsSL -o unne https://github.com/unne-cli/core/releases/download/latest/unne-darwin-arm64
chmod +x unne
sudo mv unne /usr/local/bin/
```

### Windows

`unne-windows-amd64.exe` файлын жүктеп алып, PATH-қа қосыңыз.

## Бірінші рет баптау

Орнатудан кейін CLI-ді баптаңыз:

```bash
unne setup
```

Бұл сервермен байланыс деректерін қамтитын `~/.unne/settings.yml` файлын жасайды:

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## Байланысты тексеру

```bash
unne check
```

Бұл CLI-дің Unne серверіне қосыла алатынын растайды.
