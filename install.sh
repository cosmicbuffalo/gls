#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${GLS_INSTALL_DIR:-$HOME/.local/bin}"

mkdir -p "$INSTALL_DIR"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ -f "$SCRIPT_DIR/bin/gls" ]]; then
  cp "$SCRIPT_DIR/bin/gls" "$INSTALL_DIR/gls"
else
  curl -fsSL "https://raw.githubusercontent.com/cosmicbuffalo/gls/main/bin/gls" -o "$INSTALL_DIR/gls"
fi

chmod +x "$INSTALL_DIR/gls"

echo "gls installed to $INSTALL_DIR/gls"

if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
  echo "NOTE: $INSTALL_DIR is not in your PATH. Add it with:"
  echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
fi
