#!/bin/zsh

alias reload!='. ~/.zshrc && echo "Zshrc Reloaded"'
alias reset!='reset; tmux clear-history; clear'
alias grip='grep -i'
alias notify='terminal-notifier -title "Command $(([[ $? == 0  ]] && echo Succeeded) || echo Failed)" -message "The last command you ran has finished"'
alias fuckit='exit'
alias fuck!='exit'
