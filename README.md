# Usage

`./install`

## Maintenance

`mise run update-submodules`

## Fonts

- [Lilex Nerd Font](https://www.nerdfonts.com) [(zip)](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Lilex.zip)

## Notes

### Keyboard "extend" mode with caps lock

Instead of using Colemak's caps-lock-as-backspace, caps lock shifts modes to an "extend" layer, [based on this post](https://dreymar.colemak.org/layers-extend.html). Not everything is used from there, because it's a pain configuring it consistently across OSes.

| Colemak | QWERTY | Effect     |
| ------- | ------ | ---------- |
| UNEI    | IJKL   | arrow keys |
| LY      | UO     | home/end   |
| JH      | YH     | pg up/down |
| O       | ;      | backspace  |
| ;       | P      | delete     |
| A       | A      | backspace  |
| Q       | Q      | escape     |

On an iPad using a remote session, caps lock is bound to `alt` for SSH connections, since you can't bind globally.

### Remote shell shims

On remote hosts, installing nushell as a login shell is a little more painful and it's nice to use the mise shim for it. Leave the login shell as bash, and exec nushell on interactive mode:

### bash on remote host

`.bashrc`

```bash
export PATH="$HOME/.local/share/mise/shims:$PATH"
[ -n "$PS1" ] && exec nu # use nushell if shell is interactive
```

`.bash_profile`

```bash
# bash is weird about when bashrc loads, so load it here too
source ~/.bashrc
```
