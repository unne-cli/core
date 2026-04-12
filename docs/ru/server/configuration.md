# Конфигурация сервера

## Файл конфигурации

Расположение по умолчанию: в той же директории, что и бинарный файл (`config.yml`), или указывается через `--config`.

```yaml
server:
  domain: "tunnel.example.com"   # Ваш домен
  control_port: 8222             # Порт для подключений CLI
  http_port: 8223                # Порт для HTTP-прокси

storage:
  database: "/etc/unne/unne.db"  # Путь к базе данных SQLite

logging:
  file_path: "/var/log/unne/server.log"

admin:
  enabled: true                  # Включить панель администратора
  port: 4041                     # Порт панели администратора
  session_ttl: "24h"             # Длительность сессии администратора
```

## Команды конфигурации в стиле Git

Чтение и изменение значений конфигурации без ручного редактирования YAML:

```bash
# Получить значение
unns config get server.domain
# → tunnel.example.com

# Установить значение
unns config set server.domain newtunnel.example.com

# Показать все значения
unns config list
# → server.domain = tunnel.example.com
# → server.control_port = 8222
# → server.http_port = 8223
# → storage.database = /etc/unne/unne.db
# → ...
```

## Пользовательский путь к конфигурации

```bash
unns --config /path/to/config.yml
```

## Справочник конфигурации

| Ключ | Тип | По умолчанию | Описание |
|------|-----|--------------|----------|
| `server.domain` | string | -- | Домен сервера для поддоменов |
| `server.control_port` | int | `8222` | Порт подключения CLI |
| `server.http_port` | int | `8223` | Порт HTTP-прокси |
| `storage.database` | string | `/etc/unne/unne.db` | Путь к базе данных SQLite |
| `logging.file_path` | string | -- | Путь к файлу логов |
| `admin.enabled` | bool | `true` | Включить панель администратора |
| `admin.port` | int | `4041` | Порт панели администратора |
| `admin.session_ttl` | string | `24h` | Длительность сессии администратора |
