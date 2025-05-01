#!/bin/bash
set -euxo pipefail

if [[ $(uname) != "Linux" ]]; then
  exit 0
fi

# github release fetcher
command -v dra || ./dra/install.sh --to ~/.local/bin

# core shell stuff
command -v nu || dra download -a -o ~/.local/bin \
    -I nu \
    -I nu_plugin_polars \
    -I nu_plugin_formats \
    -I nu_plugin_gstat \
    -I nu_plugin_query \
    nushell/nushell
command -v starship || dra download -a -o ~/.local/bin \
    -I starship \
    starship/starship
command -v carapace || dra download -a -o ~/.local/bin \
    -I carapace \
    carapace-sh/carapace-bin

# more shell goodies
command -v mise || dra download -a -o ~/.local/bin \
    -I mise \
    jdx/mise
command -v yazi || dra download -a -o ~/.local/bin \
    -I yazi \
    sxyazi/yazi

# utilities
command -v bat || dra download -a -o ~/.local/bin \
    -I bat \
    sharkdp/bat
command -v btop || dra download -a -o ~/.local/bin \
    -I btop \
    aristocratos/btop
command -v nvim || dra download -o ~/.local/bin/nvim \
    -s nvim-linux-$(uname -m).appimage \
    neovim/neovim

