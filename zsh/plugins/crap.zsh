#!/bin/zsh

crap() {
    CRAPPER="$@"
    NOTIFIER="terminal-notifier -message '$CRAPPER crashed out like a tit'"

    [ -n "$CRAPPER" ] || return 1

    eval "$CRAPPER"
    eval "$NOTIFIER"
}
