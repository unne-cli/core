# TCP-туннели

TCP-туннели перенаправляют необработанный TCP-трафик, что подходит для баз данных, SSH, игровых серверов и других не-HTTP протоколов.

## Быстрый туннель

```bash
# Открыть доступ к локальному PostgreSQL
unne tcp 5432 --remote-port 15432
```

Это сделает ваш локальный PostgreSQL доступным по адресу `tunnel.example.com:15432`.

## Из конфигурации

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

## Подключение к TCP-туннелям

```bash
# PostgreSQL
psql -h tunnel.example.com -p 15432 -U myuser mydb

# SSH
ssh -p 2222 user@tunnel.example.com

# MySQL
mysql -h tunnel.example.com -P 13306 -u root
```

## Отличия от HTTP-туннелей

| Функция | HTTP | TCP |
|---------|------|-----|
| Маршрутизация | На основе поддомена | На основе порта |
| Инспекция запросов | Полные заголовки + тело | Только метаданные соединения |
| Страница предупреждения | Да (настраивается) | Нет |
| Разбор протокола | С пониманием HTTP | Необработанные байты |

## Диапазон портов

Удаленные порты должны быть в диапазоне от `1024` до `65535`. Порты ниже 1024 зарезервированы.

Если запрашиваемый порт уже занят, вы получите ошибку `STATUS_UNNE_PORT_UNAVAILABLE`.
