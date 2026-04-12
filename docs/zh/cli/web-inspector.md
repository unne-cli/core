# Web 检查器

Web 检查器提供了类似 Chrome DevTools 网络控制台风格的界面，用于在浏览器中监控隧道流量。

## 启用

```bash
# 快速隧道
unne http 3000 --webui

# 自定义端口
unne http 3000 --webui --webui-port 9090

# 在配置文件中
gui:
  webui: true
  webui_port: 4040
```

在浏览器中打开 `http://localhost:4040`。

## 功能

- **请求表格** — 方法、状态码、主机、路径、IP、耗时、隧道名称
- **请求详情面板** — 可调整大小的分屏面板，显示请求头和正文
- **实时更新** — 通过 WebSocket 实时推送
- **过滤** — 按方法、路径、状态码、IP 搜索
- **隧道过滤** — 显示特定隧道的请求
- **按 IP 分组** — 切换按客户端 IP 分组显示
- **JSON 格式化** — 如果正文是有效的 JSON，将自动格式化
- **清除** — 重置请求列表

## API 端点

Web 检查器暴露了一组 REST API：

| 方法 | 路径 | 说明 |
|------|------|------|
| `GET` | `/api/requests` | 列出捕获的请求 |
| `GET` | `/api/requests?tunnel=name` | 按隧道过滤 |
| `GET` | `/api/requests/:id` | 获取请求详情 |
| `WS` | `/api/ws` | 用于实时更新的 WebSocket |
