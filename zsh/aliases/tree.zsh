#!/bin/zsh

alias trees='[[ -d src ]] && tree src; [[ -d lib  ]] && tree lib'
alias trapp='[[ -d app ]] && tree app'
alias tronf='[[ -d config ]] && tree config'
alias treet='( [[ -d test* ]] && tree test* ) || ( [[ -d spec* ]] && tree spec* )'
alias treets='trees; treet;'
