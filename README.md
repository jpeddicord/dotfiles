# Usage

use https://www.chezmoi.io/quick-start/

```
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply jpeddicord
```

## Fonts

- [Lilex Nerd Font](https://www.nerdfonts.com) [(zip)](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Lilex.zip)

## Notes

### Keyboard "extend" mode with caps lock

Instead of using Colemak's capslock-as-backspace, caps lock shifts modes to an "extend" layer, [based on this post](https://dreymar.colemak.org/layers-extend.html). Not everything is used from there, because it's a pain configuring it consistently across OSes. This is mostly for the right side of the keyboard.

On the left side, I've re-bound many keys so that capslock acts as ctrl, except for a couple left-hand shortcuts like A for backspace.

| Colemak | QWERTY | Effect     |
| ------- | ------ | ---------- |
| UNEI    | IJKL   | arrow keys |
| LY      | UO     | home/end   |
| JH      | YH     | pg up/down |
| O       | ;      | backspace  |
| ;       | P      | delete     |
| A       | A      | backspace  |
| Q       | Q      | escape     |

Capslock as Ctrl, mostly for Windows:

- WFPG (no Q)
- RSTD (no A)
- ZXCV

On an iPad using a remote session, caps lock is bound to `ctrl` for SSH connections, since you can't bind globally.

## Hashes in scripts

Lines like `# hash {{ ...` ensure a script changes when another file does, so it runs on relevant updates.
