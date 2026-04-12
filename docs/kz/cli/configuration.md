# CLI баптау

Unne CLI біріктірілетін екі конфигурация файлын қолданады:

## Жалпы параметрлер (`~/.unne/settings.yml`)

`unne setup` арқылы жасалады. Сервермен байланыс ақпаратын қамтиды:

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## Жоба конфигурациясы (`unne.yml`)

Туннельдерді анықтау үшін жоба түбіне орналастырыңыз:

```yaml
version: "3"

# Жалпы параметрлерді қайта анықтау (міндетті емес)
# server: "tunnel.example.com"
# port: 8222
# authtoken: "your-auth-token"

# Барлық қосылыстар үшін прокси (міндетті емес)
# proxy:
#   url: "socks5://127.0.0.1:1080"

# GUI параметрлері
gui:
  tui: true           # Терминал UI-ді қосу
  webui: false        # Web инспекторды қосу
  webui_port: 4040    # Web инспектор порты

# Браузер ескерту бетін өткізіп жіберу
# skip_warning: true

tunnels:
  - name: web-app
    protocol: http
    subdomain: myapp        # міндетті емес, берілмесе автоматты жасалады
    upstream: localhost:3000

  - name: api
    protocol: http
    upstream: localhost:8080

  - name: postgres
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432
```

## Конфигурацияны біріктіру

Параметрлер келесі ретпен біріктіріледі (кейінгі алдыңғыны қайта анықтайды):

1. `~/.unne/settings.yml` (жалпы әдепкі мәндер)
2. `unne.yml` (жоба конфигурациясы)
3. CLI жалаушалары (`--proxy`, `--subdomain`, т.б.)

## Арнайы конфигурация жолын пайдалану

```bash
unne start --config /path/to/custom.yml
```
