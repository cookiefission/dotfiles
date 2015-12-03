#!/bin/zsh

alias -g groot='"$(git rev-parse --show-toplevel)"'
alias gr='groot'
alias repo='basename groot'
alias chg='git status --porcelain | cut -c 4-'
alias lastchange='git diff-tree --no-commit-id --name-only -r HEAD'
alias ochg='(cd groot && vim $(chg))'
alias olast='(cd groot && vim $(lastchange))'
alias oconflicts='(cd groot && vim $(git diff --name-only --diff-filter=U))'
alias last-tag="git tag --sort=v:refname | egrep '^[v]*\d+(?:\.\d+)*' | tail -n 1"
alias h=g
alias cpbr='git rev-parse --abbrev-ref HEAD | pbcopy'
