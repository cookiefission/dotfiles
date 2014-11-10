#!/bin/zsh

function here_be_dragons() {
    if ! [[ "$PWD" =~ "$HOME" ]]; then
        echo ' %F{1}🐲  Here be Dragons%f'
    fi
    exit $?
}
