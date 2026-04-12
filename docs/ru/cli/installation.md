# Установка CLI

## Скачивание

Скачайте бинарный файл для вашей платформы с [GitHub Releases](https://github.com/unne-cli/core/releases):

| Файл | Платформа |
|------|-----------|
| `unne-darwin-amd64` | macOS Intel |
| `unne-darwin-arm64` | macOS Apple Silicon |
| `unne-linux-amd64` | Linux x86_64 |
| `unne-linux-arm64` | Linux ARM64 |
| `unne-windows-amd64.exe` | Windows x64 |

### macOS / Linux

```bash
# Пример: macOS Apple Silicon
curl -fsSL -o unne https://github.com/unne-cli/core/releases/download/latest/unne-darwin-arm64
chmod +x unne
sudo mv unne /usr/local/bin/
```

### Windows

Скачайте `unne-windows-amd64.exe` и добавьте его в переменную окружения PATH.

## Первоначальная настройка

После установки настройте CLI:

```bash
unne setup
```

Это создаст файл `~/.unne/settings.yml` с параметрами подключения к серверу:

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## Проверка подключения

```bash
unne check
```

Эта команда подтверждает, что CLI может связаться с сервером Unne.
