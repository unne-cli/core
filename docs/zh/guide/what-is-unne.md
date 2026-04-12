# 什么是 Unne？

Unne 是一个自托管的隧道解决方案，允许你通过自己的服务器将本地服务暴露到互联网。可以把它看作 ngrok、Cloudflare Tunnel 或 localtunnel 的自托管替代方案。

## 组件

Unne 由两个部分组成：

| 组件 | 说明 |
|------|------|
| **Unne CLI** (`unne`) | 在你的机器上运行的客户端应用，用于创建隧道 |
| **Unne Server** (`unns`) | 接受隧道连接并路由流量的服务器应用 |

## 工作原理

```
互联网 → Unne Server（你的 VPS）→ Yamux 多路复用 → Unne CLI → 本地服务
                                ↑
                    subdomain.yourdomain.com
```

1. 在具有公网 IP 和域名的 VPS 上运行 `unns`
2. 将 `*.yourdomain.com` 的 DNS 指向你的服务器
3. 在本地机器上运行 `unne http 3000`
4. Unne CLI 连接到服务器，建立多路复用隧道
5. 你的本地服务现在可以通过 `https://random.yourdomain.com` 访问

## 主要特性

- **HTTP 隧道** — 支持自定义或自动生成的子域名
- **TCP 隧道** — 适用于数据库、SSH 及其他协议
- **TUI 仪表盘** — 类似 mitmproxy 风格的请求检查器
- **Web 检查器** — Chrome DevTools 网络控制台风格
- **用户管理** — 按用户设置限制和配额
- **管理面板** — 用于服务器管理的 Web 界面
- **代理支持** — 支持 SOCKS5、HTTP CONNECT
- **警告页面** — 首次访问者确认页面（可配置）

## 协议

Unne 使用 [yamux](https://github.com/hashicorp/yamux) 在单个 TCP 连接上多路复用多个流。这允许客户端和服务器之间进行高效的双向通信，而无需打开多个端口。

## 安全性

- 令牌以 SHA-256 哈希存储（从不以明文存储）
- 管理员密码使用 bcrypt 加密
- 按用户设置协议限制和流量限额
- 首次访问者的浏览器警告页面
- 基于会话的管理员认证
