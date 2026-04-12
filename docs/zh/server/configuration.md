# 服务器配置文件

## 配置文件

默认位置：与二进制文件同目录的 `config.yml`，或通过 `--config` 指定。

```yaml
server:
  domain: "tunnel.example.com"   # 你的域名
  control_port: 8222             # CLI 连接端口
  http_port: 8223                # HTTP 代理端口

storage:
  database: "/etc/unne/unne.db"  # SQLite 数据库路径

logging:
  file_path: "/var/log/unne/server.log"

admin:
  enabled: true                  # 启用管理面板
  port: 4041                     # 管理面板端口
  session_ttl: "24h"             # 管理员会话持续时间
```

## Git 风格的配置命令

无需手动编辑 YAML，可直接读取和修改配置值：

```bash
# 获取配置值
unns config get server.domain
# → tunnel.example.com

# 设置配置值
unns config set server.domain newtunnel.example.com

# 列出所有配置值
unns config list
# → server.domain = tunnel.example.com
# → server.control_port = 8222
# → server.http_port = 8223
# → storage.database = /etc/unne/unne.db
# → ...
```

## 自定义配置路径

```bash
unns --config /path/to/config.yml
```

## 配置参考

| 键 | 类型 | 默认值 | 说明 |
|----|------|--------|------|
| `server.domain` | string | — | 用于子域名的服务器域名 |
| `server.control_port` | int | `8222` | CLI 连接端口 |
| `server.http_port` | int | `8223` | HTTP 代理端口 |
| `storage.database` | string | `/etc/unne/unne.db` | SQLite 数据库路径 |
| `logging.file_path` | string | — | 日志文件路径 |
| `admin.enabled` | bool | `true` | 启用管理面板 |
| `admin.port` | int | `4041` | 管理面板端口 |
| `admin.session_ttl` | string | `24h` | 管理员会话持续时间 |
