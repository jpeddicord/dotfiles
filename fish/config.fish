# set language
if not set -q LANG
    set -gx LANG "en_US.UTF-8"
end

# editors
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER "less"

# path additions
# fish_user_paths doesn't work well with home directory paths
for path in ~/.local/bin ~/.cargo/bin
    if not contains $path $PATH
        set -x PATH $path $PATH
    end
end

# louder sudo prompt
set -gx SUDO_PROMPT (set_color -b magenta white)"[sudo]"(set_color normal)" password for %u: "(echo -e '\a')

# simple aliases
alias l 'exa --git --long'
alias ll 'exa --git --long --all'
alias rm 'rm -i'
alias tmux 'tmux -2'

# load up any scripts that need to run after this
for conf in ~/.config/fish/conf-after.d/*.fish
    source $conf
end
