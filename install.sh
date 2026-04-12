#!/bin/bash
set -e

# =========================================
# Unne Server (unns) — Installer
# Auto-detects OS/arch, installs binary,
# and runs first-time setup.
# =========================================

VERSION="${UNNE_VERSION:-latest}"
BASE_URL="${UNNE_DOWNLOAD_URL:-https://github.com/unne-cli/core/releases/download}"
INSTALL_DIR="/etc/unne"
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

check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        err "Run as root: sudo bash install.sh"
        exit 1
    fi
}

main() {
    bold "=== Unne Server Installer ==="
    echo ""

    check_root

    OS=$(detect_os)
    ARCH=$(detect_arch)
    BINARY="${BIN_NAME}-${OS}-${ARCH}"

    info "Detected: ${OS}/${ARCH}"
    echo ""

    mkdir -p "$INSTALL_DIR"
    mkdir -p /var/log/unne

    # Find binary: local first, then download
    if [ -f "./$BINARY" ]; then
        info "Using local binary: ./$BINARY"
        cp "./$BINARY" "$INSTALL_DIR/$BIN_NAME"
    elif [ -f "./server-dist/$BINARY" ]; then
        info "Using local binary: ./server-dist/$BINARY"
        cp "./server-dist/$BINARY" "$INSTALL_DIR/$BIN_NAME"
    else
        DOWNLOAD_URL="${BASE_URL}/${VERSION}/${BINARY}"
        info "Downloading: $DOWNLOAD_URL"
        if command -v curl &>/dev/null; then
            curl -fsSL -o "$INSTALL_DIR/$BIN_NAME" "$DOWNLOAD_URL"
        elif command -v wget &>/dev/null; then
            wget -qO "$INSTALL_DIR/$BIN_NAME" "$DOWNLOAD_URL"
        else
            err "curl or wget required."; exit 1
        fi
    fi

    chmod +x "$INSTALL_DIR/$BIN_NAME"
    ln -sf "$INSTALL_DIR/$BIN_NAME" /usr/local/bin/$BIN_NAME
    ok "Installed: /usr/local/bin/$BIN_NAME"
    echo ""

    # Systemd (Linux only)
    if [ "$OS" = "linux" ] && command -v systemctl &>/dev/null; then
        info "Creating systemd service..."
        cat > /etc/systemd/system/unne.service <<EOF
[Unit]
Description=Unne Tunnel Server
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=$INSTALL_DIR
ExecStart=$INSTALL_DIR/$BIN_NAME --config $INSTALL_DIR/config.yml
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
        systemctl daemon-reload
        ok "Systemd service: unne.service"
    fi

    echo ""

    # First-time setup
    if [ ! -f "$INSTALL_DIR/config.yml" ]; then
        bold "--- First-time Setup ---"
        echo ""
        $BIN_NAME setup

        if [ "$OS" = "linux" ] && command -v systemctl &>/dev/null; then
            systemctl enable unne
            systemctl start unne
            echo ""
            ok "Server started and enabled on boot."
        fi
    else
        ok "Config exists: $INSTALL_DIR/config.yml"
        if [ "$OS" = "linux" ] && command -v systemctl &>/dev/null; then
            systemctl restart unne 2>/dev/null || true
            ok "Server restarted."
        fi
    fi

    echo ""
    bold "=== Installation Complete ==="
    echo ""
    echo "Commands:"
    echo "  unns setup              Initial configuration"
    echo "  unns config list        View config"
    echo "  unns user create ...    Create users"
    echo "  unns token gen ...      Generate tokens"
    if [ "$OS" = "linux" ]; then
        echo "  systemctl status unne   Check server status"
    fi
    echo ""
}

main "$@"
