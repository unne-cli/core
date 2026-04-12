# 错误码

Unne 使用以 `STATUS_UNNE_` 为前缀的标准化错误码。

## 错误码参考

| 错误码 | 说明 |
|--------|------|
| `STATUS_UNNE_AUTH_FAILED` | 认证令牌无效或已过期 |
| `STATUS_UNNE_SUBDOMAIN_TAKEN` | 请求的子域名已被占用 |
| `STATUS_UNNE_PROTOCOL_ERROR` | 握手协议错误（请求格式错误） |
| `STATUS_UNNE_TUNNEL_LIMIT` | 你的账户已达到最大隧道数限制 |
| `STATUS_UNNE_PROTOCOL_DENIED` | 你的账户不允许使用此协议 |
| `STATUS_UNNE_TRAFFIC_EXCEEDED` | 当前周期的流量限额已超出 |
| `STATUS_UNNE_DEVICE_LIMIT` | 你的账户已达到最大设备数限制 |
| `STATUS_UNNE_USER_DISABLED` | 你的用户账户已被管理员禁用 |
| `STATUS_UNNE_TOKEN_DISABLED` | 此令牌已被撤销或禁用 |
| `STATUS_UNNE_PORT_UNAVAILABLE` | 请求的 TCP 端口不可用 |
| `STATUS_UNNE_SERVER_ERROR` | 服务器内部错误 |

## HTTP 错误页面

通过浏览器访问隧道时，服务器会显示样式化的错误页面：

| 页面 | HTTP 状态码 | 触发条件 |
|------|-------------|----------|
| **警告** | 200 | 浏览器首次访问（需要确认） |
| **未找到** | 404 | 隧道/子域名不存在 |
| **离线** | 502 | 隧道存在但上游不可达 |
| **错误** | 不固定 | 包含错误码和描述的通用错误 |

## 旧版错误码

为了向后兼容旧版服务器：

| 旧版 | 新错误码 |
|------|----------|
| `UNNE_ERR_403` | `STATUS_UNNE_AUTH_FAILED` |
| `UNNE_ERR_102` | `STATUS_UNNE_SUBDOMAIN_TAKEN` |
| `UNNE_ERR_101` | `STATUS_UNNE_PROTOCOL_ERROR` |
