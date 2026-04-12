# Конфигурация CLI

Unne CLI использует два конфигурационных файла, которые объединяются вместе:

## Глобальные настройки (`~/.unne/settings.yml`)

Создается командой `unne setup`. Содержит информацию о подключении к серверу:

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## Конфигурация проекта (`unne.yml`)

Размещается в корне вашего проекта для определения туннелей:

```yaml
version: "3"

# Переопределение глобальных настроек (необязательно)
# server: "tunnel.example.com"
# port: 8222
# authtoken: "your-auth-token"

# Прокси для всех подключений (необязательно)
# proxy:
#   url: "socks5://127.0.0.1:1080"

# Настройки интерфейса
gui:
  tui: true           # Включить терминальный интерфейс
  webui: false        # Включить веб-инспектор
  webui_port: 4040    # Порт веб-инспектора

# Пропустить страницу предупреждения в браузере
# skip_warning: true

tunnels:
  - name: web-app
    protocol: http
    subdomain: myapp        # необязательно, генерируется автоматически если не указан
    upstream: localhost:3000

  - name: api
    protocol: http
    upstream: localhost:8080

  - name: postgres
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432
```

## Объединение конфигураций

Настройки объединяются в следующем порядке (более поздние переопределяют более ранние):

1. `~/.unne/settings.yml` (глобальные значения по умолчанию)
2. `unne.yml` (конфигурация проекта)
3. Флаги CLI (`--proxy`, `--subdomain` и т.д.)

## Использование пользовательского пути к конфигурации

```bash
unne start --config /path/to/custom.yml
```
