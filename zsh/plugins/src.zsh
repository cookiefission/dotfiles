#!/bin/zsh

function src () {
    if [ "$#" -eq 0 ]; then
        cd ~/src
        return
    fi

    local zdir
    zdir=$(cd ~/src && find . -maxdepth 2 -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | \
    cut -sd / -f 2- | \
    fzf +m --select-1 --query="$@") &&
    cd "$HOME/src/$zdir"
}
