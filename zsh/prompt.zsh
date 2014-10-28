#!/bin/zsh

setopt prompt_subst

source $HOME/.zsh/prompt/git.zsh
PROMPT='%F{5}[%F{2}%T%F{5}] %F{7}%2~$(git_prompt) %F{51}→ %f'

_here_be_dragons() {
    if ! [[ "$PWD" =~ "$HOME" ]]; then
        echo '%F{1}Here be Dragons%f'
    fi
}
RPROMPT='$(_here_be_dragons)'
