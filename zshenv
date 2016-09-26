#!/bin/zsh

# Go loading
export GOPATH=/Users/sean/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH=$PATH:/Users/sean/.cargo/bin

# Home
export PATH=$HOME/.bin:$PATH

# Homebrew
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# RVM
export PATH=$HOME/.rvm/bin:$PATH

eval "$(rbenv init -)"
