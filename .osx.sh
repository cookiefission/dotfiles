#!/bin/sh

# Apps
open 'https://www.google.co.uk/chrome/browser/desktop/index.html'
open 'https://slack.com/apps'
open 'https://agilebits.com/onepassword/mac'
open 'https://www.iterm2.com'

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Dock
## Add stack of recent applications
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1;  }; "tile-type" = "recents-tile";  }'

## Enable autohide
defaults write com.apple.Dock autohide -bool true

## Restart
killall Dock

# Finder
## Show path in Finder
defaults write com.apple.finder ShowPathbar -bool true

## Don't write .DS_Store on USBs
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Misx osx config
## Set high key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02
