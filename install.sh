#!/bin/sh
set -ex
cd "$(dirname $0)"

# bootstrap mise if not present
alias mise=./setup/mise.run.sh

[ -e ~/.config/mise ] || ln -s "$PWD/files/_config/mise" ~/.config/mise
mkdir -p ~/.config/mise/conf.d
touch ~/.config/mise/config.toml  # mise will write to the first config file it sees
ln -sf "$(realpath mise.global.toml)" ~/.config/mise/conf.d/dotfiles.toml  # and it shouldn't touch this one

mise cfg  # diagnostic print
mise install  # install tools
mise run setup  # then the actual dotfiles setup script
