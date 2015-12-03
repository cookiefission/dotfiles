#!/bin/zsh

z() {
    local zdir
    zdir=$(cd ~ && find Code Repositories Documents -maxdepth 5 -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | \
    fzf +m --select-1 --query="$@") &&
    cd "$HOME/$zdir"
}
