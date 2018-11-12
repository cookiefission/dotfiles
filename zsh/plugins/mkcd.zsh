#!/bin/zsh

mkcd() {
    local dir=${1?Must pass directory to create}

    mkdir -p "$dir" && cd "$dir"
}

gmkcd() {
    local dir=${1?Must pass directory to create}

    mkdir -p "$dir" && cd "$dir" && git init
}
