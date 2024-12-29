function fish_user_key_bindings
    set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    source ~/.dotfiles/modules/fzf/shell/key-bindings.fish
    fzf_key_bindings
end
