#!/bin/zsh

if [ -d /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
else
    echo "zsh-completions not installed. On OSX: brew install zsh-completions" >&2
fi

if [ -d ~/.zsh/completions ]; then
    fpath=(~/.zsh/completions $fpath)
fi
