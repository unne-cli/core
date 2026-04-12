# 服务器配置

## 交互式配置

运行配置向导：

```bash
unns setup
```

你将被要求输入：

1. **域名** — 例如 `tunnel.example.com`
2. **控制端口** — 客户端连接端口（默认：`8222`）
3. **HTTP 端口** — 公网 HTTP 代理端口（默认：`8223`）
4. **数据库路径** — SQLite 数据库位置（默认：`/etc/unne/unne.db`）
5. **日志路径** — 日志文件路径（默认：`/var/log/unne/server.log`）
6. **管理面板** — 启用/禁用及端口设置
7. **管理员凭据** — 用户名和密码

配置向导将会：
- 创建配置文件（`config.yml`）
- 初始化 SQLite 数据库
- 创建管理员用户
- 生成第一个认证令牌

::: tip 请保存你的令牌！
生成的令牌只会显示一次。请立即复制保存。
:::

## 手动配置

如果你更喜欢手动配置：

### 1. 创建 config.yml

```yaml
server:
  domain: "tunnel.example.com"
  control_port: 8222
  http_port: 8223
storage:
  database: "/etc/unne/unne.db"
logging:
  file_path: "/var/log/unne/server.log"
admin:
  enabled: true
  port: 4041
  session_ttl: "24h"
```

### 2. 创建管理员用户

```bash
unns user create admin yourpassword admin
```

### 3. 生成令牌

```bash
unns token gen 1 my-laptop
```
