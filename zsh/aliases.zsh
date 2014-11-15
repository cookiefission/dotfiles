#!/bin/zsh

for aliases_file in $HOME/.zsh/aliases/*; do
    source $aliases_file
done
