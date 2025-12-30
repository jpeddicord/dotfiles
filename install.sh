#!/bin/sh
set -ex
cd "$(dirname $0)"

# bootstrap mise if not present
which mise || ./setup/mise.run.sh

mkdir -p ~/.config
[ -e ~/.config/mise ] || ln -s "$PWD/files/_config/mise" ~/.config/mise
mkdir -p ~/.config/mise/conf.d
touch ~/.config/mise/config.toml  # mise will write to the first config file it sees
ln -sf "$(realpath mise.global.toml)" ~/.config/mise/conf.d/dotfiles.toml  # and it shouldn't touch this one

export PATH="$HOME/.local/bin:$PATH"
mise trust  # trust this repo's config
mise doctor || true  # diagnostic print
mise install || true   # install tools
mise run setup  # then the actual dotfiles setup script
