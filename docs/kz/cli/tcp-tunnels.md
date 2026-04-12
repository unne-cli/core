# TCP туннельдер

TCP туннельдер деректер базалары, SSH, ойын серверлері және басқа HTTP емес протоколдар үшін қолайлы шикі TCP трафикті бағыттайды.

## Жылдам туннель

```bash
# Жергілікті PostgreSQL-ді ашу
unne tcp 5432 --remote-port 15432
```

Бұл сіздің жергілікті PostgreSQL-ді `tunnel.example.com:15432` мекенжайында қолжетімді етеді.

## Конфигурациядан

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

## TCP туннельдерге қосылу

```bash
# PostgreSQL
psql -h tunnel.example.com -p 15432 -U myuser mydb

# SSH
ssh -p 2222 user@tunnel.example.com

# MySQL
mysql -h tunnel.example.com -P 13306 -u root
```

## HTTP туннельдерден айырмашылықтар

| Мүмкіндік | HTTP | TCP |
|-----------|------|-----|
| Бағыттау | Субдомен негізінде | Порт негізінде |
| Сұраныстарды тексеру | Толық тақырыптар + дене | Тек қосылыс метадеректері |
| Ескерту беті | Иә (баптауға болады) | Жоқ |
| Протоколды талдау | HTTP-ді түсінеді | Шикі байттар |

## Порт диапазоны

Қашықтағы порттар `1024` мен `65535` арасында болуы тиіс. 1024-тен төмен порттар резервтелген.

Егер сұралған порт бос болмаса, `STATUS_UNNE_PORT_UNAVAILABLE` қатесін аласыз.
