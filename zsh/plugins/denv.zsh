#!/bin/zsh

denv() {
    local machine

    if [ -z $1 ]; then
        machine='default'
    else
        machine=$1
        shift
    fi

    eval $(docker-machine env $machine $@)
}
