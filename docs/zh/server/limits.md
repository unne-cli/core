# 限制与配额

Unne Server 支持按用户设置限制以控制资源使用。

## 可用限制

| 限制 | 说明 | 默认值 |
|------|------|--------|
| `max_tunnels` | 最大同时隧道数 | `0`（无限制） |
| `max_devices` | 最大同时令牌连接数 | `0`（无限制） |
| `allowed_protocols` | 允许的隧道协议 | `http,tcp` |
| `traffic_limit` | 每周期最大流量（字节） | `0`（无限制） |
| `traffic_period` | 限制周期：`daily`、`monthly`、`quarterly` | `monthly` |
| `skip_warning` | 允许客户端跳过浏览器警告 | `false` |
| `can_use_proxy` | 允许代理连接 | `true` |

## 限制执行方式

限制在客户端连接时的握手阶段进行检查：

1. **令牌验证** — 令牌存在且已启用
2. **用户验证** — 用户存在且已启用
3. **协议检查** — 请求的协议在 `allowed_protocols` 中
4. **设备限制** — 该用户的唯一活跃令牌数量
5. **隧道限制** — 该用户的活跃隧道数量
6. **流量限制** — 当前周期的累计字节数

如果任何检查失败，连接将被拒绝并返回相应的 `STATUS_UNNE_*` 错误码。

## 流量跟踪

流量按隧道跟踪，每 30 秒刷新到数据库。计数器包括入站和出站字节数。

### 流量周期

| 周期 | 重置时间 |
|------|----------|
| `daily` | 午夜（服务器时区） |
| `monthly` | 每月 1 日 |
| `quarterly` | 1 月 1 日、4 月 1 日、7 月 1 日、10 月 1 日 |

## 示例

### 免费套餐：仅 HTTP，3 个隧道，每月 1GB

```
max_tunnels: 3
allowed_protocols: http
traffic_limit: 1073741824
traffic_period: monthly
max_devices: 1
```

### 专业套餐：无限制

```
max_tunnels: 0
allowed_protocols: http,tcp
traffic_limit: 0
max_devices: 0
skip_warning: true
```

## 设置限制

限制可以通过以下方式设置：
- **管理面板** — 编辑用户表单
- **CLI** — `unns user create`（基础设置），然后通过管理面板编辑详细限制
