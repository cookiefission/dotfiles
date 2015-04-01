#!/bin/zsh

alias notify='terminal-notifier -title "Command $(([[ $? == 0  ]] && echo Succeeded) || echo Failed)" -message "The last command you ran has finished"'
alias n=notify
alias -g N!='; notify'
