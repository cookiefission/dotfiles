#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

#Prompt
if [[ -f ~/.bash/gitprompt.sh ]]; then
    source ~/.bash/gitprompt.sh
else
    git_prompt() {
        git rev-parse --abbrev-ref HEAD
    }
fi

_prompt_command() {
PS1="\e]2;\u@\h: \w\a\\A \[\033[1m\]\W\[\033[0m\]`git_prompt`\$ "
}
PROMPT_COMMAND=_prompt_command

#History
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=5000
shopt -s cmdhist

#Includes
if [ -f ~/.profile ]; then
    . ~/.profile
fi
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
if [ -d ~/.bash_completion.d ]; then
    . ~/.bash_completion.d/*
fi

# View markdown file in man pages style
# Function because aliases don't accept arguments
manmd() {
    pandoc -s -f markdown -t man $1 | man -l -
}

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

mkcd() {
    mkdir -p "$@" && cd "$@"
}
