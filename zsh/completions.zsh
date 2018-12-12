#!/bin/zsh

if [ -d /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
elif [ -d $HOME/.zsh-completions ]; then
    fpath=($HOME/.zsh-completions $fpath)
else
    echo "zsh-completions not installed. On OSX: brew install zsh-completions" >&2
fi

if [ -d ~/.zsh/completions ]; then
    fpath=(~/.zsh/completions $fpath)
fi

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
