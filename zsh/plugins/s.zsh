#!/bin/zsh

function s() {
    if [ -z $TMUX ]; then
        echo "Not running in tmux"
        return 1
    fi
    local SPLIT_COMMAND="$*"
    tmux split-window -v "$SPLIT_COMMAND; sleep 2"
    tmux last-pane
}
