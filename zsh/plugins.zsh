#!/bin/zsh

for plugin in $HOME/.zsh/plugins/*; do
    source $plugin
done
