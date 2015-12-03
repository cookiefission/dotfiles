#!/bin/zsh

vimf() {
    local file
    file=$(fzf --query="$1" --select-1 --exit-0 -m)
    [ -n "$file" ] && vim -p "$file"
}
