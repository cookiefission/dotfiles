if [ -d ~/.zsh ]; then
    source ~/.zsh/zshrc.sh
    PROMPT='%B%M%~%b$(git_super_status) %# '
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/sean/.zshrc'

autoload -Uz compinit
compinit

if [ -e ~/.shell_aliases ]; then
    source ~/.shell_aliases
fi

source ~/.fzf.zsh

# This is quite probably the best function of all time
z() {
    local zdir
    zdir=$(cd ~ && find * -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | \
    fzf +m --select-1 --query="$@") &&
  cd "$HOME/$zdir"
}

zd() {
    local dir
    dir=$(find ${1:-*} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}

vimf() {
    local file
    file=$(fzf --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && vim "$file"
}
