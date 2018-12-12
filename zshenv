#!/bin/zsh

# Go loading
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH=$PATH:/Users/sean/.cargo/bin

# Home
export PATH=$HOME/.bin:$PATH

# Homebrew
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# Rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
