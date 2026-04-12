# 架构

## 系统概览

```
┌─────────────────┐         ┌──────────────────────────┐
│   Unne CLI      │         │     Unne Server          │
│                 │   TCP   │                          │
│  本地服务       │◄───────►│  控制面板    (:8222)     │
│  TUI 仪表盘    │  yamux  │  HTTP 代理   (:8223)     │
│  Web 检查器    │         │  管理面板    (:4041)     │
│                 │         │  TCP 监听器  (动态)      │
└─────────────────┘         └──────────────────────────┘
```

## 连接流程

### 握手协议 (v2)

```
客户端 → 服务器:
  UNNE_HANDSHAKE:v2
  TOKEN:<auth_token>
  PROTOCOL:<http|tcp>
  SUBDOMAIN:<name>           # HTTP 隧道
  REMOTE_PORT:<port>         # TCP 隧道
  SKIP_WARNING:1             # 可选

服务器 → 客户端:
  UNNE_READY:<subdomain>     # HTTP 成功
  UNNE_READY_TCP:<port>      # TCP 成功
  STATUS_UNNE_*              # 错误码
```

### HTTP 请求流程

```
浏览器 → Server:8223 → 从 Host 头提取子域名
  → 查找 yamux 会话 → 打开流 → 转发到客户端
  → 客户端转发到 localhost:PORT → 响应原路返回
```

### TCP 请求流程

```
TCP 客户端 → Server:REMOTE_PORT → 打开 yamux 流
  → 转发到客户端 → 客户端转发到 localhost:PORT
  → 双向原始 TCP 转发
```

## 数据存储

| 组件 | 存储方式 | 用途 |
|------|----------|------|
| 服务器 | SQLite (`unne.db`) | 用户、令牌、会话、流量日志 |
| 服务器 | YAML (`config.yml`) | 服务器配置 |
| 客户端 | YAML (`~/.unne/settings.yml`) | 全局客户端设置 |
| 客户端 | YAML (`unne.yml`) | 项目本地隧道配置 |
| 客户端 | 内存环形缓冲区 | 捕获的 HTTP 交换数据 |

## 项目结构

```
cmd/
  unne/main.go              # CLI 客户端入口
  unns/main.go       # 服务器入口
internal/
  config/                   # 客户端配置
  tunnel/                   # 隧道客户端 + HTTP 捕获
  tui/                      # BubbleTea 终端 UI
  webui/                    # 客户端侧 Web 检查器
  proxy/                    # SOCKS5/HTTP 代理拨号器
  server/                   # 服务器核心 + HTTP 处理器
  store/                    # SQLite 数据层
  admin/                    # 管理面板 WebUI
  setup/                    # 服务器配置向导 + 配置 CLI
```
