# HTTP 隧道

HTTP 隧道通过 Unne Server 上的公共子域名暴露本地 HTTP 服务。

## 快速隧道

```bash
unne http 3000
```

这会创建一个带有自动生成子域名的隧道，例如 `a8f3k2m1.tunnel.example.com`。

## 自定义子域名

```bash
unne http 3000 --subdomain myapp
```

你的服务将可通过 `myapp.tunnel.example.com` 访问。

## 通过配置文件

在 `unne.yml` 中：

```yaml
tunnels:
  - name: frontend
    protocol: http
    subdomain: app
    upstream: localhost:3000

  - name: api
    protocol: http
    subdomain: api
    upstream: localhost:8080
```

启动所有隧道：

```bash
unne start
```

## 多隧道

运行多个隧道时，TUI 会为每个隧道显示标签页（类似 pm2 风格）。使用 `Tab` / `Shift+Tab` 在隧道之间切换。

## 跳过浏览器警告

默认情况下，首次通过浏览器访问的用户会看到一个确认页面。要跳过此页面（如果你的账户有权限）：

```bash
unne http 3000 --skip-warning
```

或在配置文件中：

```yaml
skip_warning: true
```

## 请求检查

通过隧道的每个 HTTP 请求/响应都会被捕获以供检查：
- **TUI**：在请求上按 `Enter` 查看请求头和正文
- **Web 检查器**：添加 `--webui` 参数，然后打开 `http://localhost:4040`
