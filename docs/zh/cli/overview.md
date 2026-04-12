# Unne CLI 概览

Unne CLI 是一个客户端应用，用于从本地机器创建到 Unne Server 的隧道。

## 命令

| 命令 | 说明 |
|------|------|
| `unne setup` | 交互式首次配置 |
| `unne http <port>` | 快速创建 HTTP 隧道 |
| `unne tcp <port>` | 快速创建 TCP 隧道 |
| `unne start` | 启动 `unne.yml` 中定义的隧道 |
| `unne check` | 验证服务器连通性 |
| `unne version` | 显示版本信息 |
| `unne help` | 显示帮助 |

## 全局参数

| 参数 | 说明 |
|------|------|
| `--config <path>` | 配置文件路径（默认：`unne.yml`） |
| `--subdomain <name>` | 指定子域名（仅 HTTP） |
| `--remote-port <port>` | 远程端口（仅 TCP） |
| `--proxy <url>` | 代理 URL（`socks5://` 或 `http://`） |
| `--skip-warning`、`--sw` | 跳过浏览器警告页面 |
| `--no-tui` | 禁用 TUI，使用纯日志输出 |
| `--webui` | 启用 Web 检查器 |
| `--webui-port <port>` | Web 检查器端口（默认：`4040`） |

## 快速示例

```bash
# 暴露本地 Web 应用
unne http 3000

# 使用自定义子域名暴露
unne http 3000 --subdomain myapp

# PostgreSQL 的 TCP 隧道
unne tcp 5432 --remote-port 15432

# 从配置文件启动所有隧道，并开启 Web 检查器
unne start --webui

# 通过代理的无头模式
unne http 8080 --no-tui --proxy socks5://127.0.0.1:1080
```
