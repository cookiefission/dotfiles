#!/bin/sh

# OSX config
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write NSGlobalDomain KeyRepeat -int 0.02

defaults write com.apple.Dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1;  }; "tile-type" = "recents-tile";  }'
defaults write com.apple.Dock autohide -bool true
killall Dock

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
