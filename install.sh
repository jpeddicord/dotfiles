#!/bin/sh
set -ex
cd "$(dirname $0)"

# bootstrap mise if not present
which mise || ./setup/mise.run.sh
alias mise=~/.local/bin/mise

mkdir -p ~/.config/mise/conf.d
touch ~/.config/mise/config.toml  # mise will write to the first config file it sees
ln -sf "$(realpath mise.global.toml)" ~/.config/mise/conf.d/dotfiles.toml  # and it shouldn't touch this one

mise cfg  # diagnostic print
mise install  # install tools
mise run setup  # then the actual dotfiles setup script
