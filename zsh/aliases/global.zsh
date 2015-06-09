#!/bin/zsh

alias -g JSON='| jq "."'
alias -g XML='| xmllint --format -'
alias -g G='| grep'
alias -g P='>&2'
alias -g LAST='| tail -n 1'
alias -g ...='../../..'
alias -g TRIM='| cut -c 1-$COLUMNS'
