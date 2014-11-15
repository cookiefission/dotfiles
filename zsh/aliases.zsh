#!/bin/zsh

for aliases in $HOME/.zsh/aliases/*; do
    source $aliases
done
