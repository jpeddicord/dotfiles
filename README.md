usage
=====

`./install`

whee

related packages
================

- [direnv](https://direnv.net)
- [exa](https://the.exa.website/)
- [fd](https://github.com/sharkdp/fd)
- [fish](https://fishshell.com/)
- [fzf](https://github.com/junegunn/fzf)
- [icdiff](https://github.com/jeffkaufman/icdiff)
- [neovim](https://github.com/neovim/neovim)
- [ranger](https://github.com/ranger/ranger)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [tmux](https://github.com/tmux/tmux)

all in one go
-------------

```bash
## packaged stuff
# ubuntu
sudo apt install build-essential direnv exa fd-find fish fzf icdiff neovim ranger ripgrep tmux
# arch
sudo pacman -Sy base-devel direnv fd fish fzf neovim ranger ripgrep tmux
yay icdiff
```

maintenance
===========

`git submodule update --recursive --remote`
