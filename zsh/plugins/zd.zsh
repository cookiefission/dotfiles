#!/bin/zsh

list_dirs() {
    find * -maxdepth 3 -path '*/\.*' -prune -o -type d -print 2> /dev/null
}

zd() {
    local dir
    dir=$(list_dirs | fzf +m --select-1 --query="$@" --exit-0 ) && cd "$dir"
}
