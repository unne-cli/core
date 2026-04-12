# 快速开始

## 前提条件

- 一台具有公网 IP 地址的 VPS 或服务器
- 一个配置了通配符 DNS 的域名（`*.yourdomain.com → 服务器 IP`）

## 快速配置

### 1. 配置服务器

在你的 VPS 上：

```bash
# 一键安装（自动检测操作系统和架构，运行配置向导）
curl -fsSL https://raw.githubusercontent.com/unne-cli/core/main/install.sh | sudo bash
```

或者从 [GitHub Releases](https://github.com/unne-cli/core/releases) 手动下载。

配置向导会询问：
- 服务器域名（例如 `tunnel.example.com`）
- 控制端口（默认：`8222`）
- HTTP 代理端口（默认：`8223`）
- 管理面板设置
- 管理员凭据

### 2. 配置 DNS

将通配符 DNS 记录指向你的服务器：

```
*.tunnel.example.com → YOUR_SERVER_IP
```

### 3. 安装 CLI

在本地机器上 — 从 [Releases](https://github.com/unne-cli/core/releases) 下载，然后：

```bash
# 配置客户端
unne setup
```

按提示输入你的服务器地址、端口和认证令牌。

### 4. 创建你的第一个隧道

```bash
# 启动一个本地 Web 服务器（示例）
python3 -m http.server 8080

# 在另一个终端中创建隧道
unne http 8080
```

你的本地服务器现在可以通过 `https://random.tunnel.example.com` 访问。

## 下一步

- [CLI 配置](/zh/cli/configuration) — 了解 `unne.yml` 配置文件
- [HTTP 隧道](/zh/cli/http-tunnels) — 自定义子域名、多隧道
- [TCP 隧道](/zh/cli/tcp-tunnels) — 数据库和 SSH 隧道
- [服务器配置](/zh/server/setup) — 详细的服务器配置
- [用户管理](/zh/server/users) — 创建用户和设置限制
