# Unne Server 概览

Unne Server 是中继组件，负责接受来自 CLI 客户端的隧道连接，并将互联网流量路由到已连接的隧道。

## 命令

| 命令 | 说明 |
|------|------|
| `unns` | 启动服务器 |
| `unns setup` | 交互式初始配置 |
| `unns config get <key>` | 获取配置值 |
| `unns config set <key> <value>` | 设置配置值 |
| `unns config list` | 列出所有配置值 |
| `unns user create <user> <pass> [role]` | 创建用户 |
| `unns user list` | 列出所有用户 |
| `unns user delete <id>` | 删除用户 |
| `unns token gen <user_id> [device]` | 生成令牌 |
| `unns token list [user_id]` | 列出令牌 |
| `unns token revoke <token_id>` | 撤销令牌 |
| `unns setup-check` | 输出服务器信息供 CLI 配置使用 |

## 端口

| 端口 | 用途 |
|------|------|
| 控制端口（默认：`8222`） | CLI 客户端连接（yamux） |
| HTTP 代理（默认：`8223`） | 公网 HTTP 流量路由 |
| 管理面板（默认：`4041`） | Web 管理界面 |
| TCP（动态） | 按隧道分配的 TCP 监听器 |

## 存储

Unne Server 使用 SQLite 进行数据持久化：

- **用户** — 带有角色和限制的账户
- **令牌** — 绑定到用户和设备的认证令牌
- **会话** — 管理面板登录会话
- **流量日志** — 按用户的流量跟踪，用于配额管理
