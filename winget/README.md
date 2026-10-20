# winget manifests

Two packages in the Windows Package Manager:

| Package | Installs | Command |
|---------|----------|---------|
| `Unne.CLI` | only the `unne` command line (portable) | `winget install Unne.CLI` |
| `Unne.App` | the desktop app (tray + window) **and** the `unne` command | `winget install Unne.App` |

`Unne.App` uses the windowed build (`unne-app-windows-*.exe`) as an installer:
`app install --no-login` installs it per user into `%LOCALAPPDATA%\Programs\Unne`
without UI and registers the "Unne" entry in Apps & Features (`app uninstall`).

## New version

Copy the previous version folder, bump `PackageVersion`, `ReleaseDate`, the
URLs and `InstallerSha256` (from the release's `checksums.txt`), then open one
PR per package to microsoft/winget-pkgs — or let wingetcreate do it:

```powershell
wingetcreate update Unne.CLI --version 3.3.0 --submit --urls `
  "https://github.com/unne-cli/core/releases/download/v3.3.0/unne-windows-amd64.exe|x64" `
  "https://github.com/unne-cli/core/releases/download/v3.3.0/unne-windows-arm64.exe|arm64" `
  "https://github.com/unne-cli/core/releases/download/v3.3.0/unne-windows-386.exe|x86"
wingetcreate update Unne.App --version 3.3.0 --submit --urls `
  "https://github.com/unne-cli/core/releases/download/v3.3.0/unne-app-windows-amd64.exe|x64" `
  "https://github.com/unne-cli/core/releases/download/v3.3.0/unne-app-windows-arm64.exe|arm64" `
  "https://github.com/unne-cli/core/releases/download/v3.3.0/unne-app-windows-386.exe|x86"
```

Validate locally: `winget validate --manifest winget/manifests/u/Unne/<App|CLI>/<version>`.
