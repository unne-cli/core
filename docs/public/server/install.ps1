# =========================================
# Unne - Windows Installer (CLI + Server)
# Auto-detects architecture, downloads binary.
# Usage:
#   irm https://unne.site/server/install.ps1 | iex
# Options (environment variables, work with irm | iex):
#   $env:UNNE_COMPONENT   = "cli" | "server" | "both"
#   $env:UNNE_VERSION     = "v3.1.0"
#   $env:UNNE_INSTALL_DIR = "C:\path\to\dir"
# Or run the file directly:
#   .\install.ps1 -Component both -Version v3.1.0
# =========================================

& {
param(
    [ValidateSet("cli", "server", "both")]
    [string]$Component = $(if ($env:UNNE_COMPONENT) { $env:UNNE_COMPONENT } else { "server" }),
    [string]$Version = $(if ($env:UNNE_VERSION) { $env:UNNE_VERSION } else { "latest" }),
    [string]$InstallDir = $(if ($env:UNNE_INSTALL_DIR) { $env:UNNE_INSTALL_DIR } else { "$env:LOCALAPPDATA\Unne" })
)

$ErrorActionPreference = "Stop"
# Invoke-WebRequest is extremely slow with the progress bar in Windows PowerShell 5.1
$ProgressPreference = "SilentlyContinue"
# GitHub requires TLS 1.2; Windows PowerShell 5.1 may default to TLS 1.0
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$BaseURL = if ($env:UNNE_DOWNLOAD_URL) { $env:UNNE_DOWNLOAD_URL } else { "https://github.com/unne-cli/core/releases/download" }

function Get-Arch {
    # PROCESSOR_ARCHITEW6432 is set when running 32-bit PowerShell on 64-bit Windows
    $arch = if ($env:PROCESSOR_ARCHITEW6432) { $env:PROCESSOR_ARCHITEW6432 } else { $env:PROCESSOR_ARCHITECTURE }
    switch ($arch) {
        "AMD64" { return "amd64" }
        "ARM64" { return "arm64" }
        "x86"   { return "386" }
        default { throw "Unsupported architecture: $arch" }
    }
}

function Install-Binary($name, $arch) {
    $binary = "${name}-windows-${arch}.exe"
    $url = if ($Version -eq "latest") { ($BaseURL -replace "/download$", "") + "/latest/download/$binary" } else { "$BaseURL/$Version/$binary" }
    $dest = Join-Path $InstallDir "${name}.exe"
    $tmp = "$dest.download"

    Write-Host "  Downloading $binary..." -ForegroundColor Cyan
    try {
        Invoke-WebRequest -Uri $url -OutFile $tmp -UseBasicParsing
    } catch {
        Remove-Item $tmp -Force -ErrorAction SilentlyContinue
        throw "Failed to download ${url}: $($_.Exception.Message)"
    }

    try {
        Move-Item -Path $tmp -Destination $dest -Force
    } catch {
        Remove-Item $tmp -Force -ErrorAction SilentlyContinue
        throw "Cannot replace $dest. Close any running '$name' process and try again."
    }
    Write-Host "  Installed: $dest" -ForegroundColor Green
}

try {
    Write-Host "=== Unne Windows Installer ===" -ForegroundColor White
    Write-Host ""

    $arch = Get-Arch
    Write-Host "Architecture: windows/$arch" -ForegroundColor Cyan
    Write-Host "Version:      $Version" -ForegroundColor Cyan
    Write-Host ""

    if (!(Test-Path $InstallDir)) {
        New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
    }

    if ($Component -eq "cli" -or $Component -eq "both") {
        Write-Host "--- Unne CLI ---" -ForegroundColor White
        Install-Binary "unne" $arch
        Write-Host ""
    }

    if ($Component -eq "server" -or $Component -eq "both") {
        Write-Host "--- Unne Server ---" -ForegroundColor White
        Install-Binary "unns" $arch
        Write-Host ""
    }

    # Add to user PATH if not already there
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $entries = @($currentPath -split ";" | Where-Object { $_ } | ForEach-Object { $_.TrimEnd("\") })
    if ($entries -notcontains $InstallDir.TrimEnd("\")) {
        Write-Host "Adding $InstallDir to PATH..." -ForegroundColor Cyan
        $newPath = if ($currentPath) { "$($currentPath.TrimEnd(';'));$InstallDir" } else { $InstallDir }
        [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
        Write-Host "PATH updated. Restart your terminal for changes to take effect." -ForegroundColor Yellow
    }
    if (($env:Path -split ";") -notcontains $InstallDir) {
        $env:Path = "$env:Path;$InstallDir"
    }

    Write-Host ""
    Write-Host "=== Installation Complete ===" -ForegroundColor Green
    Write-Host ""
    Write-Host "Commands:"

    if ($Component -eq "cli" -or $Component -eq "both") {
        Write-Host "  unne setup              Configure server connection"
        Write-Host "  unne http <port>        Create HTTP tunnel"
        Write-Host "  unne tcp <port>         Create TCP tunnel"
    }

    if ($Component -eq "server" -or $Component -eq "both") {
        Write-Host "  unns setup              Initial server configuration"
        Write-Host "  unns config list        View config"
        Write-Host "  unns user create ...    Create users"
    }

    Write-Host ""
} catch {
    # Don't use 'exit' here: under 'irm | iex' it would close the user's terminal
    Write-Host ""
    Write-Host "Installation failed: $($_.Exception.Message)" -ForegroundColor Red
}
} @args
