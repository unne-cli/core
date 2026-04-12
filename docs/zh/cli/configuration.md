# CLI 配置

Unne CLI 使用两个配置文件，它们会被合并在一起：

## 全局设置 (`~/.unne/settings.yml`)

由 `unne setup` 创建。包含服务器连接信息：

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## 项目配置 (`unne.yml`)

放在项目根目录下，用于定义隧道：

```yaml
version: "3"

# 覆盖全局设置（可选）
# server: "tunnel.example.com"
# port: 8222
# authtoken: "your-auth-token"

# 所有连接的代理（可选）
# proxy:
#   url: "socks5://127.0.0.1:1080"

# GUI 设置
gui:
  tui: true           # 启用终端 UI
  webui: false        # 启用 Web 检查器
  webui_port: 4040    # Web 检查器端口

# 跳过浏览器警告页面
# skip_warning: true

tunnels:
  - name: web-app
    protocol: http
    subdomain: myapp        # 可选，省略则自动生成
    upstream: localhost:3000

  - name: api
    protocol: http
    upstream: localhost:8080

  - name: postgres
    protocol: tcp
    remote_port: 15432
    upstream: localhost:5432
```

## 配置合并

设置按以下顺序合并（后者覆盖前者）：

1. `~/.unne/settings.yml`（全局默认值）
2. `unne.yml`（项目配置）
3. CLI 参数（`--proxy`、`--subdomain` 等）

## 使用自定义配置路径

```bash
unne start --config /path/to/custom.yml
```
