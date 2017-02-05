#!/bin/zsh

alias -g JSON='| jq "."'
alias -g XML='| xmllint --format -'
alias -g G='| grep'
alias -g LAST='| tail -n 1'
alias -g TRIM='| cut -c 1-$COLUMNS'
