#!/bin/zsh

if [ -d /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -d ~/.zsh/completions ]; then
    fpath=(~/.zsh/completions $fpath)
fi
