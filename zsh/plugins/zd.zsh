#!/bin/zsh

list_dirs() {
    for dir in *; do
        if [ -d "$dir" ]; then
            echo "$dir/"
        fi
    done
}

zd() {
    local dir
    dir=$(list_dirs | fzf +m --select-1 --query="$@" --exit-0 ) && cd "$dir"
}
