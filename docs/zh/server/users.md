# 用户管理

Unne Server 拥有完整的用户管理系统，支持按用户设置限制和访问控制。

## CLI 命令

```bash
# 创建用户
unns user create john p@ssw0rd

# 创建管理员
unns user create admin secret admin

# 列出用户
unns user list

# 删除用户（级联删除关联令牌）
unns user delete 3
```

## 用户属性

| 字段 | 说明 | 默认值 |
|------|------|--------|
| `username` | 唯一登录名 | — |
| `password` | 使用 bcrypt 哈希存储 | — |
| `role` | `admin` 或 `user` | `user` |
| `enabled` | 账户启用/禁用 | `true` |
| `max_tunnels` | 最大同时隧道数（`0` = 无限制） | `0` |
| `allowed_protocols` | 逗号分隔：`http`、`tcp` 或 `http,tcp` | `http,tcp` |
| `traffic_limit` | 每周期最大字节数（`0` = 无限制） | `0` |
| `traffic_period` | `daily`、`monthly` 或 `quarterly` | `monthly` |
| `max_devices` | 最大令牌/设备数（`0` = 无限制） | `0` |
| `skip_warning` | 允许跳过浏览器警告 | `false` |
| `can_use_proxy` | 允许使用代理 | `true` |

## 访问控制示例

### 仅 HTTP 用户，最多 5 个隧道

```bash
unns user create webdev pass123
# 然后通过管理面板设置：allowed_protocols=http, max_tunnels=5
```

### 每月 1GB 流量限制的用户

在管理面板中设置 `traffic_limit=1073741824`（1GB 的字节数）和 `traffic_period=monthly`。

### 单设备用户

设置 `max_devices=1` — 只能有一个活跃令牌。每个令牌代表一个设备。

## 管理面板

用户也可以通过 `http://localhost:4041` 的 Web 管理面板进行管理。参见[管理面板](/zh/server/admin-panel)。
