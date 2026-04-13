$ErrorActionPreference = "Stop"

# =========================================
# Unne — Windows Installer (CLI + Server)
# Auto-detects architecture, downloads binary.
# Usage:
#   irm https://raw.githubusercontent.com/unne-cli/core/main/install.ps1 | iex
# Or:
#   .\install.ps1 -Component cli
#   .\install.ps1 -Component server
#   .\install.ps1 -Component both
# =========================================

param(
    [ValidateSet("cli", "server", "both")]
    [string]$Component = "both",
    [string]$Version = "v2.0.0",
    [string]$InstallDir = "$env:LOCALAPPDATA\Unne"
)

$BaseURL = "https://github.com/unne-cli/core/releases/download"

function Get-Arch {
    $arch = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture
    switch ($arch) {
        "X64"   { return "amd64" }
        "Arm64" { return "arm64" }
        "X86"   { return "386" }
        default {
            Write-Host "Unsupported architecture: $arch" -ForegroundColor Red
            exit 1
        }
    }
}

function Download-Binary($name, $arch) {
    $binary = "${name}-windows-${arch}.exe"
    $url = "$BaseURL/$Version/$binary"
    $dest = "$InstallDir\${name}.exe"

    Write-Host "  Downloading $binary..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing

    if (Test-Path $dest) {
        Write-Host "  Installed: $dest" -ForegroundColor Green
    } else {
        Write-Host "  Failed to download $binary" -ForegroundColor Red
        exit 1
    }
}

# Main
Write-Host "=== Unne Windows Installer ===" -ForegroundColor White
Write-Host ""

$arch = Get-Arch
Write-Host "Architecture: windows/$arch" -ForegroundColor Cyan
Write-Host ""

# Create install directory
if (!(Test-Path $InstallDir)) {
    New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
}

# Download components
if ($Component -eq "cli" -or $Component -eq "both") {
    Write-Host "--- Unne CLI ---" -ForegroundColor White
    Download-Binary "unne" $arch
    Write-Host ""
}

if ($Component -eq "server" -or $Component -eq "both") {
    Write-Host "--- Unne Server ---" -ForegroundColor White
    Download-Binary "unns" $arch
    Write-Host ""
}

# Add to PATH if not already there
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$InstallDir*") {
    Write-Host "Adding $InstallDir to PATH..." -ForegroundColor Cyan
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$InstallDir", "User")
    $env:Path = "$env:Path;$InstallDir"
    Write-Host "PATH updated. Restart your terminal for changes to take effect." -ForegroundColor Yellow
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
