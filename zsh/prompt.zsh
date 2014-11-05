#!/bin/zsh

setopt prompt_subst

for prompt in $HOME/.zsh/prompt/*; do
    source $prompt
done

PROMPT='%F{5}[%F{2}%T%F{5}] %F{7}%2~$(git_prompt) %F{51}→ %f'

RPROMPT='$(here_be_dragons) '
