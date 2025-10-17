# Usage

`./install`

# Maintenance

`mise run update-submodules`

# Notes

## Keyboard "extend" mode with caps lock

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

## Nushell on remote hosts

Keep system shell as bash. Misc tools can break with nu as default. E.g. Zed will have trouble setting up a remote connection.

In `.bashrc` add:

```bash
eval "$(~/.local/bin/mise activate bash)"
[ -n "$PS1" ] && exec nu # use nushell if shell is interactive
```

And `.bash_profile`:

```bash
source ~/.bashrc
```
