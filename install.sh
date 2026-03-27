#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${GLS_INSTALL_DIR:-$HOME/.local/bin}"

mkdir -p "$INSTALL_DIR"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "SCRIPT_DIR=$SCRIPT_DIR"
echo "INSTALL_DIR=$INSTALL_DIR"

if [[ -f "$SCRIPT_DIR/bin/gls" ]]; then
  echo "Source: $SCRIPT_DIR/bin/gls ($(wc -l < "$SCRIPT_DIR/bin/gls") lines)"
  cp "$SCRIPT_DIR/bin/gls" "$INSTALL_DIR/gls"
  echo "Copied local bin/gls to $INSTALL_DIR/gls"
else
  echo "Local bin/gls not found, downloading from GitHub..."
  curl -fsSL "https://raw.githubusercontent.com/cosmicbuffalo/gls/main/bin/gls" -o "$INSTALL_DIR/gls"
  echo "Downloaded to $INSTALL_DIR/gls"
fi

chmod +x "$INSTALL_DIR/gls"

echo "Installed file: $(wc -l < "$INSTALL_DIR/gls") lines"
echo "Installed to: $(command -v gls 2>/dev/null || echo 'gls not found in PATH')"
echo "gls installed to $INSTALL_DIR/gls"

if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
  echo "NOTE: $INSTALL_DIR is not in your PATH. Add it with:"
  echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
fi

# Clear any shell functions that shadow the installed script
if [[ -n "$ZSH_VERSION" ]]; then
  unfunction gls _gls_has_nested_changes _gls_print_line 2>/dev/null
  true
fi
