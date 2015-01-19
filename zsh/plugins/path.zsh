#!/bin/zsh

# Go loading
export GOPATH=/Users/sean/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# Add composer global bin to path
export PATH=$PATH:$HOME/.composer/vendor/bin

# Homebrew
export PATH=/usr/local/bin:$PATH

# MacPorts
export PATH=/opt/local/bin:$PATH
