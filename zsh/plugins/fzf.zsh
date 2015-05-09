#!/bin/zsh

if [ -f $HOME/.fzf.zsh ]; then
    source $HOME/.fzf.zsh
    export FZF_DEFAULT_OPTS="--reverse +i"
fi
