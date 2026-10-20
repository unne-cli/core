# winget manifests

Manifests for publishing `unne` to the Windows Package Manager (`winget install Unne.CLI`).

Submit a new version (needs a GitHub account; opens a PR to microsoft/winget-pkgs):

```powershell
winget install wingetcreate
wingetcreate submit --token <github-token> winget/manifests/u/Unne/CLI/<version>
```

Or update from the previous version automatically:

```powershell
wingetcreate update Unne.CLI --version 3.2.0 --submit `
  --urls https://github.com/unne-cli/core/releases/download/v3.2.0/unne-windows-amd64.exe|x64 `
         https://github.com/unne-cli/core/releases/download/v3.2.0/unne-windows-arm64.exe|arm64 `
         https://github.com/unne-cli/core/releases/download/v3.2.0/unne-windows-386.exe|x86
```

Validate locally: `winget validate winget/manifests/u/Unne/CLI/<version>`.
