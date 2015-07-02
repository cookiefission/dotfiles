#!/bin/zsh

alias pbfxml='pbpaste | xmllint --format - >&2 | pbcopy'
alias pbfjson='pbpaste | python -m json.tool >&2 | pbcopy'
alias pbexec='$(pbpaste)'
alias pbvim='vim $(pbpaste)'
alias pbopen='open "$(pbpaste)"'
