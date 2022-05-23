usage
=====

`./install`

whee

related packages
================

- [exa](https://the.exa.website/)
- [fish](https://fishshell.com/)
- [fd](https://github.com/sharkdp/fd)
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
sudo apt install build-essential fish fzf icdiff neovim ranger tmux
# arch
sudo pacman -Sy base-devel fish fzf neovim ranger tmux
yay icdiff
```

maintenance
===========

`git submodule update --recursive --remote`
