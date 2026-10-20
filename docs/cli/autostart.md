# Autostart (Background Service)

Run Unne in the background so your tunnels come up as soon as the computer starts — no terminal needed.

## 1. Mark tunnels to start automatically

In `unne ui`, open a tunnel and switch on **Start automatically**, or use the **Startup** page to toggle every saved tunnel at once. These tunnels connect whenever Unne starts.

In `~/.unne/tunnels.yml` it is the `autostart` field:

```yaml
- name: oracle
  protocol: tcp
  upstream: localhost:1521
  remote_port: 21521
  autostart: true
```

## 2. Install the background service

Click **Run in background at start-up** on the **Startup** page, or:

```bash
unne service install            # UI on http://localhost:4040
unne service install --port 5050
unne service status
unne service restart
unne service uninstall
```

| OS | Runs as | Starts |
|----|---------|--------|
| Windows | Windows service `unne` (asks for administrator permission) | At boot, before anyone signs in |
| Linux | systemd user unit `~/.config/systemd/user/unne.service` + lingering | At boot |
| macOS | launchd agent `~/Library/LaunchAgents/site.unne.agent.plist` | At login |

The service runs `unne ui --no-open --service` and keeps the web UI at `http://localhost:4040`, so you can still open it to start, stop or inspect tunnels. Running `unne ui` while the service is up just opens the browser.

Logs: `~/.unne/ui.log` (Windows, macOS) or `journalctl --user -u unne` (Linux).

::: tip Linux
If `loginctl enable-linger` is not permitted on your system, the service starts at login instead. Enable it once with `sudo loginctl enable-linger $USER`.
:::
