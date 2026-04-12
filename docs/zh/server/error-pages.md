# 错误页面

Unne Server 在出现问题时会向浏览器访问者显示样式化的错误页面。

## 页面类型

### 警告页面 (200)

在首次通过浏览器访问隧道时显示。要求访问者确认是否继续。

**绕过方式：**
- Cookie `unne_confirmed_<subdomain>=1`（确认后自动设置，有效期 24 小时）
- 请求头 `X-Unne-Skip-Warning: 1`
- 非浏览器 User-Agent（API 客户端、curl 等）
- 客户端参数 `--skip-warning`（需要用户拥有 `skip_warning` 权限）

### 未找到 (404)

当子域名没有活跃隧道时显示。包括：
- 错误码 `ERR_UNNE_404`
- 修复问题的 CLI 命令
- 刷新按钮

### 离线 (502)

当隧道已注册但上游不可达时显示。这意味着：
- CLI 客户端已连接到服务器
- 但本地服务未运行或未响应

### 通用错误

用于其他错误，包含自定义错误码和消息。

## 设计

所有页面使用 shadcn 风格的设计：
- 简洁的白色背景
- 带彩色左边框的警告组件（红色表示错误，琥珀色表示警告）
- Lucide 图标
- 用于调试的请求 ID 徽章
- 响应式布局

## 自定义

错误页面模板嵌入在服务器二进制文件中的 `internal/server/pages/`。要自定义：

1. Fork 仓库
2. 编辑 `internal/server/pages/` 中的 HTML 模板
3. 修改 `internal/server/pages/base.css` 中的样式
4. 重新构建服务器二进制文件

CSS 和 HTML 通过 Go 的 `embed.FS` 嵌入 — 运行时无外部依赖。
