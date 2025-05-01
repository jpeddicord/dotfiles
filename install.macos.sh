#!/bin/bash
set -euxo pipefail

if [[ $(uname) != "Darwin" ]]; then
  exit 0
fi

brew install bat btop carapace mise neovim nushell ripgrep starship yazi
