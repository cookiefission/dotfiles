#!/bin/zsh

mkcd() {
    mkdir -p "$@" && cd "$@"
}

gmkcd() {
    mkdir -p "$1" && cd "$1" && git init
}
