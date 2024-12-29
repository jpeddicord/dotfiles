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
for path in ~/.local/bin ~/.cargo/bin /opt/homebrew/bin
    if not contains $path $PATH
        set -x PATH $path $PATH
    end
end

# louder sudo prompt
set -gx SUDO_PROMPT (set_color -b magenta white)"[sudo]"(set_color normal)" password for %u: "(echo -e '\a')

# better ls
if type -q eza
    alias l 'eza --git --long'
    alias ll 'eza --git --long --all'
end

# full file browser
if type -q yazi
    alias lll 'yazi'
    alias y 'yazi'
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
