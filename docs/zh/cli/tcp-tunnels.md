# TCP 隧道

TCP 隧道转发原始 TCP 流量，适用于数据库、SSH、游戏服务器及其他非 HTTP 协议。

## 快速隧道

```bash
# 暴露本地 PostgreSQL
unne tcp 5432 --remote-port 15432
```

这会使你的本地 PostgreSQL 可通过 `tunnel.example.com:15432` 访问。

## 通过配置文件

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

## 连接 TCP 隧道

```bash
# PostgreSQL
psql -h tunnel.example.com -p 15432 -U myuser mydb

# SSH
ssh -p 2222 user@tunnel.example.com

# MySQL
mysql -h tunnel.example.com -P 13306 -u root
```

## 与 HTTP 隧道的区别

| 特性 | HTTP | TCP |
|------|------|-----|
| 路由方式 | 基于子域名 | 基于端口 |
| 请求检查 | 完整的请求头 + 正文 | 仅连接元数据 |
| 警告页面 | 有（可配置） | 无 |
| 协议解析 | HTTP 感知 | 原始字节 |

## 端口范围

远程端口必须在 `1024` 到 `65535` 之间。1024 以下的端口为保留端口。

如果请求的端口已被占用，你会收到 `STATUS_UNNE_PORT_UNAVAILABLE` 错误。
