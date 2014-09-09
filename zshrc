# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# don't share history
unsetopt SHARE_HISTORY

# aliases
alias cls='printf "\033c"'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='l -A'
alias svim='sudo vim -u $HOME/.vimrc'
alias svi='svim'
alias tmux='tmux -2'
alias ssh-dumb='export TERM=xterm; ssh'
alias venv='source env/bin/activate'
alias gopath='export GOPATH=`pwd`; path=("$GOPATH/bin" "$path[@]")'
alias pm='sudo pacman'
alias pmi='sudo pacman -S'
alias pmu='sudo pacman -Syu'
alias pmr='sudo pacman -Rs'
alias pms='sudo pacman -Ss'

# local settings
if [[ -e ~/.zshrc.local ]]; then
	source ~/.zshrc.local
fi
