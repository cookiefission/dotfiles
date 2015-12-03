#!/bin/zsh

vimag() {
    vim $(ag -l --nocolor "$1")
}

vimagu() {
    vim $(ag -l -U --nocolor "$1")
}
