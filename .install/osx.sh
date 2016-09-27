#!/bin/sh

# 'Check' SSH keys are in place

while true; do
    read -p "Have you installed your SSH keys? " yn
    case $yn in
        [Yy]* ) echo "Continuing with installation..."; break;;
        [Nn]* ) echo "Install them before continuing."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Xcode tools
echo 'Installing Xcode command line tools...'
if [ $(xcode-select --version | grep -c version) -ne 0 ]; then
  echo 'Xcode command line tools already installed'
else
  xcode-select --install
fi

# OSX config
echo 'Updating OSX config...'

defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write NSGlobalDomain KeyRepeat -int 0.02

defaults write com.apple.Dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1;  }; "tile-type" = "recents-tile";  }'
defaults write com.apple.Dock autohide -bool true
killall Dock

sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# Homebrew
echo 'Installing Homebrew...'

brew --help > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo 'Homebrew already installed'
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ $(brew tap | grep -c 'homebrew/bundle') -ne 0 ]; then
  echo 'Homebrew-bundle already installed'
else
  brew tap Homebrew/bundle
fi

# Clone dotfiles
echo 'Cloning dotfiles...'
if [ -d "$HOME/.dotfiles" ]; then
  echo 'dotfiles already cloned.'
else
  git clone git@github.com:cookiefission/dotfiles.git $HOME/.dotfiles
fi

# Install brew bundle
echo 'Installing Homebrew dependencies...'

cd ~/.dotfiles/.install
brew bundle

# Install dotfiles with rcm
echo 'Installing dotfiles...'

ln -is ~/.dotfiles/rcrc ~/.rcrc
rcup -v

# Install zsh things
echo 'Installing zsh extensions'

git clone git@github.com:zsh-users/zsh-history-substring-search.git ~/.zsh-history-substring-search
