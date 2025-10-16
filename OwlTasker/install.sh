#!/usr/bin/env bash
set -euo pipefail
BIN_NAME=OwlTasker
SRC_DIR="$(cd "$(dirname "$0")"/bin && pwd)"
DEST="$HOME/.local/bin/$BIN_NAME"

echo "Installing $BIN_NAME -> $DEST"
install -m 0755 "$SRC_DIR/$BIN_NAME.sh" "$DEST"
echo "Done. Run: $BIN_NAME"
