# CLI 安装

## 下载

从 [GitHub Releases](https://github.com/unne-cli/core/releases) 下载适合你平台的二进制文件：

| 文件 | 平台 |
|------|------|
| `unne-darwin-amd64` | macOS Intel |
| `unne-darwin-arm64` | macOS Apple Silicon |
| `unne-linux-amd64` | Linux x86_64 |
| `unne-linux-arm64` | Linux ARM64 |
| `unne-windows-amd64.exe` | Windows x64 |

### macOS / Linux

```bash
# 示例：macOS Apple Silicon
curl -fsSL -o unne https://github.com/unne-cli/core/releases/download/latest/unne-darwin-arm64
chmod +x unne
sudo mv unne /usr/local/bin/
```

### Windows

下载 `unne-windows-amd64.exe` 并将其添加到 PATH 环境变量中。

## 首次配置

安装完成后，配置 CLI：

```bash
unne setup
```

这将创建 `~/.unne/settings.yml`，其中包含你的服务器连接信息：

```yaml
server: "tunnel.example.com"
port: 8222
authtoken: "your-auth-token"
```

## 验证连接

```bash
unne check
```

这会确认 CLI 能够连接到 Unne Server。
