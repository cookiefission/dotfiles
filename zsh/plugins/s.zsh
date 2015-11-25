#!/bin/zsh

function s() {
    if [ -z $TMUX ]; then
        echo "Not running in tmux"
        return 1
    fi
    local SPLIT_COMMAND="$*"
    tmux split-window -p 30 -v "($SPLIT_COMMAND && sleep 2) || sleep 300"
    tmux last-pane
}
