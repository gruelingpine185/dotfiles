#!/usr/bin/env bash

# export environment variables
brew shellenv

# update homebrew
brew update

# upate installed formulae
brew upgrade

# terminal programs
brew install git
brew install helix
brew install iterm2
brew install showkey
brew install spaceship

# graphical applications
brew install --cask github

# fonts
brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font

# remove outdated versions
brew cleanup
