#!/bin/zsh

function vnote() {
    if [ -f "$PWD/.notes.md" ]; then
        vim "$PWD/.notes.md"
    elif ! [[ "$(git status 2>&1)" =~ Not\ a\ git\ repo ]]; then
        vim "$(git rev-parse --show-toplevel)/.notes.md"
    else
        vim "$PWD/.notes.md"
    fi
}
