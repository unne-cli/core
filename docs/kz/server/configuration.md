# Сервер конфигурациясы

## Конфигурация файлы

Әдепкі орналасуы: бинарлық файлмен бір каталогта (`config.yml`) немесе `--config` арқылы көрсетіледі.

```yaml
server:
  domain: "tunnel.example.com"   # Сіздің доменіңіз
  control_port: 8222             # CLI қосылыстары үшін порт
  http_port: 8223                # HTTP прокси үшін порт

storage:
  database: "/etc/unne/unne.db"  # SQLite деректер базасының жолы

logging:
  file_path: "/var/log/unne/server.log"

admin:
  enabled: true                  # Әкімші панелін қосу
  port: 4041                     # Әкімші панелінің порты
  session_ttl: "24h"             # Әкімші сессиясының ұзақтығы
```

## Git стиліндегі конфигурация командалары

YAML-ді қолмен өңдемей-ақ конфигурация мәндерін оқу және өзгерту:

```bash
# Мәнді алу
unns config get server.domain
# → tunnel.example.com

# Мәнді орнату
unns config set server.domain newtunnel.example.com

# Барлық мәндерді көрсету
unns config list
# → server.domain = tunnel.example.com
# → server.control_port = 8222
# → server.http_port = 8223
# → storage.database = /etc/unne/unne.db
# → ...
```

## Арнайы конфигурация жолы

```bash
unns --config /path/to/config.yml
```

## Конфигурация анықтамалығы

| Кілт | Түрі | Әдепкі | Сипаттама |
|------|------|--------|-----------|
| `server.domain` | string | -- | Субдомендер үшін сервер домені |
| `server.control_port` | int | `8222` | CLI қосылыс порты |
| `server.http_port` | int | `8223` | HTTP прокси порты |
| `storage.database` | string | `/etc/unne/unne.db` | SQLite деректер базасының жолы |
| `logging.file_path` | string | -- | Журнал файлының жолы |
| `admin.enabled` | bool | `true` | Әкімші панелін қосу |
| `admin.port` | int | `4041` | Әкімші панелінің порты |
| `admin.session_ttl` | string | `24h` | Әкімші сессиясының ұзақтығы |
