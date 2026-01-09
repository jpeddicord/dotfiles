#!/bin/sh
set -ex
cd "$(dirname $0)"

# bootstrap mise if not present
which mise || ./setup/mise.run.sh

export PATH="$HOME/.local/bin:$PATH"
mise trust           # trust this repo's config
mise doctor || true  # diagnostic print
mise install || true # install tools
