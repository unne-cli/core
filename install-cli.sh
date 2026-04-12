#!/bin/bash
set -e

# =========================================
# Unne CLI — Installer
# Auto-detects OS/arch, downloads binary.
# =========================================

VERSION="${UNNE_VERSION:-v2.0.0}"
BASE_URL="${UNNE_DOWNLOAD_URL:-https://github.com/unne-cli/core/releases/download}"
BIN_NAME="unne"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

info()  { echo -e "${CYAN}$1${NC}"; }
ok()    { echo -e "${GREEN}$1${NC}"; }
err()   { echo -e "${RED}$1${NC}" >&2; }
bold()  { echo -e "${BOLD}$1${NC}"; }

detect_os() {
    local os
    os="$(uname -s | tr '[:upper:]' '[:lower:]')"
    case "$os" in
        linux*)   echo "linux" ;;
        darwin*)  echo "darwin" ;;
        freebsd*) echo "freebsd" ;;
        *)        err "Unsupported OS: $os"; exit 1 ;;
    esac
}

detect_arch() {
    local arch
    arch="$(uname -m)"
    case "$arch" in
        x86_64|amd64)   echo "amd64" ;;
        aarch64|arm64)   echo "arm64" ;;
        armv7l|armv6l)   echo "arm" ;;
        i686|i386)       echo "386" ;;
        *)               err "Unsupported architecture: $arch"; exit 1 ;;
    esac
}

main() {
    bold "=== Unne CLI Installer ==="
    echo ""

    OS=$(detect_os)
    ARCH=$(detect_arch)
    BINARY="${BIN_NAME}-${OS}-${ARCH}"

    info "Detected: ${OS}/${ARCH}"

    INSTALL_DIR="/usr/local/bin"
    if [ "$(id -u)" -ne 0 ]; then
        INSTALL_DIR="$HOME/.local/bin"
        mkdir -p "$INSTALL_DIR"
        info "Installing to $INSTALL_DIR (no root)"
    fi

    DOWNLOAD_URL="${BASE_URL}/${VERSION}/${BINARY}"
    info "Downloading: $DOWNLOAD_URL"

    if command -v curl &>/dev/null; then
        curl -fsSL -o "$INSTALL_DIR/$BIN_NAME" "$DOWNLOAD_URL"
    elif command -v wget &>/dev/null; then
        wget -qO "$INSTALL_DIR/$BIN_NAME" "$DOWNLOAD_URL"
    else
        err "curl or wget required."; exit 1
    fi

    chmod +x "$INSTALL_DIR/$BIN_NAME"
    ok "Installed: $INSTALL_DIR/$BIN_NAME"

    # Check if in PATH
    if ! command -v $BIN_NAME &>/dev/null; then
        echo ""
        info "Add to your PATH:"
        echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
    fi

    echo ""
    bold "=== Installation Complete ==="
    echo ""
    echo "Next steps:"
    echo "  unne setup              Configure server connection"
    echo "  unne http <port>        Create HTTP tunnel"
    echo "  unne tcp <port>         Create TCP tunnel"
    echo "  unne help               Show all commands"
    echo ""
}

main "$@"
