# Архитектура

## Обзор системы

```
┌─────────────────┐         ┌──────────────────────────┐
│   Unne CLI      │         │     Unne Server          │
│                 │   TCP   │                          │
│  Локальный      │◄───────►│  Control Plane (:8222)   │
│  сервис         │  yamux  │  HTTP Proxy    (:8223)   │
│  TUI дашборд    │         │  Админ панель  (:4041)   │
│  Веб инспектор  │         │  TCP Listeners (динам.)  │
└─────────────────┘         └──────────────────────────┘
```

## Структура проекта

```
cmd/
  unne/main.go              # CLI клиент
  unns/main.go              # Сервер
internal/
  config/                   # Конфигурация клиента
  tunnel/                   # Туннельный клиент + перехват HTTP
  tui/                      # BubbleTea терминальный UI
  webui/                    # Веб инспектор клиента
  proxy/                    # SOCKS5/HTTP прокси
  server/                   # Ядро сервера + HTTP обработчик
  store/                    # SQLite слой данных
  admin/                    # Админ панель WebUI
  setup/                    # Setup wizard + config CLI
```
