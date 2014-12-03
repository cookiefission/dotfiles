#!/bin/zsh

crap() {
    CRAPPER="$@"
    NOTIFIER="terminal-notifier -message '$CRAPPER crashed out like a tit'"

    if ! [ -n "$CRAPPER" ]; then
        echo "No command given" && return 1
    fi

    eval "$CRAPPER"
    eval "$NOTIFIER"
}
