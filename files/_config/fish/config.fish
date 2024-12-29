# set language
if not set -q LANG
    set -gx LANG "en_US.UTF-8"
end

# path additions
fish_add_path -ga ~/.local/bin
fish_add_path -ga ~/.cargo/bin
fish_add_path -ga /opt/homebrew/bin

# louder sudo prompt
set -gx SUDO_PROMPT (set_color -b magenta white)"[sudo]"(set_color normal)" password for %u: "(echo -e '\a')

# editors
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER "less"
if type -q nvim
    alias vi nvim
    alias vim nvim
end

# better ls
if type -q eza
    alias l 'eza --git --long'
    alias ll 'eza --git --long --all'
end

# interactive rm + mac homebrew coreutils check
if type -q grm
    alias rm 'grm -i'
else
    alias rm 'rm -i'
end

# load up any scripts that need to run after this
for conf in ~/.config/fish/conf-after.d/*.fish
    source $conf
end
