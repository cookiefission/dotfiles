#!/bin/zsh

alias -g GITROOT='"$(git rev-parse --show-toplevel)"'
alias gr='cd GITROOT'
alias repo='basename GITROOT'
alias chg='git status --porcelain | grep -v -e "\.lock$" | cut -c 4-'
alias lastchange='git diff-tree --no-commit-id --name-only -r HEAD'
alias ochg='(cd GITROOT && vim $(chg))'
alias olast='(cd GITROOT && vim $(lastchange))'
alias oconflicts='(cd GITROOT && vim $(git diff --name-only --diff-filter=U))'
alias last-tag="git tag --sort=v:refname | egrep '^[v]*\d+(?:\.\d+)*' | tail -n 1"
alias h=g
alias cpbr='git rev-parse --abbrev-ref HEAD | pbcopy'
