# 代理支持

Unne CLI 可以通过 HTTP 或 SOCKS5 代理路由其服务器连接。

## 用法

### CLI 参数

```bash
unne http 3000 --proxy socks5://127.0.0.1:1080
unne http 3000 --proxy http://user:pass@proxy.corp.com:8080
```

### 配置文件

全局代理（适用于所有隧道）：

```yaml
proxy:
  url: "socks5://127.0.0.1:1080"
```

按隧道配置代理：

```yaml
tunnels:
  - name: web
    protocol: http
    upstream: localhost:3000
    proxy:
      url: "http://corpproxy:8080"
```

## 支持的代理类型

| 协议 | 类型 | 认证方式 |
|------|------|----------|
| `socks5://` | SOCKS5 | 通过 URL 传递用户名/密码 |
| `http://` | HTTP CONNECT | 通过 URL 传递 Basic 认证 |
| `https://` | HTTPS CONNECT | 通过 URL 传递 Basic 认证 |

## 认证

在代理 URL 中包含凭据：

```
socks5://user:password@proxy:1080
http://user:password@proxy:8080
```

## 服务器端限制

服务器管理员可以按用户禁用代理使用。如果你的账户没有 `can_use_proxy` 权限，代理设置在连接层会被忽略，但不会导致错误。
