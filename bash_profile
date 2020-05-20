#!/usr/bin/env bash

#Prompt
if [[ -f ~/.bash/gitprompt.sh ]]; then
    source ~/.bash/gitprompt.sh
fi

_prompt_command() {
    PS1="\e]2;\u@\h: \w\a\\A \[\033[1m\]\W\[\033[0m\]`git_prompt`→ "
}
PROMPT_COMMAND=_prompt_command

#History
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=5000
shopt -s cmdhist

#Includes
if [ -f ~/.profile ]; then
    source  ~/.profile
fi
if [ -f ~/.bash_profile.local ]; then
    source  ~/.bash_profile.local
fi
if [ -f /opt/local/etc/bash_completion ]; then
    source  /opt/local/etc/bash_completion
fi
if [ -d ~/.bash_completion.d ]; then
    source  ~/.bash_completion.d/*
fi
