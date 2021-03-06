#!/bin/zsh

setopt prompt_subst

for prompt in $HOME/.zsh/prompt/*; do
    source $prompt
done

PROMPT='%F{5}[%F{2}%T%F{5}] %F{7}%2~$(git_prompt) %F{51}→ %f'

RPROMPT='%(?:%F{2}✓:%F{1}✘)%f$(here_be_dragons)$(running_jobs_count)$(rbenv_prompt_info)'
