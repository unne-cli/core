# Архитектура

## Жүйеге шолу

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

## Қосылыс ағымы

### Қол алысу (v2)

```
Client → Server:
  UNNE_HANDSHAKE:v2
  TOKEN:<auth_token>
  PROTOCOL:<http|tcp>
  SUBDOMAIN:<name>           # HTTP үшін
  REMOTE_PORT:<port>         # TCP үшін
  SKIP_WARNING:1             # міндетті емес

Server → Client:
  UNNE_READY:<subdomain>     # HTTP сәтті
  UNNE_READY_TCP:<port>      # TCP сәтті
  STATUS_UNNE_*              # қате кодтары
```

### HTTP сұраныс ағымы

```
Браузер → Server:8223 → Host тақырыбынан субдоменді алу
  → yamux сессиясын іздеу → Ағынды ашу → Клиентке бағыттау
  → Клиент localhost:PORT-қа бағыттайды → Жауап кері қайтады
```

### TCP сұраныс ағымы

```
TCP клиент → Server:REMOTE_PORT → yamux ағынын ашу
  → Клиентке бағыттау → Клиент localhost:PORT-қа бағыттайды
  → Екі бағытты TCP бағыттау
```

## Деректерді сақтау

| Компонент | Сақтау орны | Мақсаты |
|-----------|-------------|---------|
| Сервер | SQLite (`unne.db`) | Пайдаланушылар, токендер, сессиялар, трафик журналы |
| Сервер | YAML (`config.yml`) | Сервер конфигурациясы |
| Клиент | YAML (`~/.unne/settings.yml`) | Глобалды клиент параметрлері |
| Клиент | YAML (`unne.yml`) | Жоба туннелінің конфигурациясы |
| Клиент | Жадтағы сақина буфері | Жиналған HTTP алмасулар |

## Жоба құрылымы

```
cmd/
  unne/main.go              # CLI клиентінің кіру нүктесі
  unns/main.go       # Серверлік кіру нүктесі
internal/
  config/                   # Клиент конфигурациясы
  tunnel/                   # Туннель клиенті + HTTP жинау
  tui/                      # BubbleTea терминал UI
  webui/                    # Клиенттік web инспектор
  proxy/                    # SOCKS5/HTTP прокси тергеуші
  server/                   # Сервер ядросы + HTTP өңдеуші
  store/                    # SQLite деректер қабаты
  admin/                    # Әкімші панелі WebUI
  setup/                    # Сервер орнату шебері + конфигурация CLI
```
