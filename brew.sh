#!/usr/bin/env bash

# export environment variables
brew shellenv

# update homebrew
brew update

# upate installed formulae
brew upgrade

brew tap zegervdv/zathura

# terminal programs
brew install girara --HEAD
brew install git
brew install helix
brew install iterm2
brew install zathura-pdf-poppler
brew install showkey
brew install spaceship
brew install zathura --HEAD

# language servers
brew install bash-language-server

# graphical applications
brew install --cask brave-browser
brew install --cask github

# fonts
brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font

# remove outdated versions
brew cleanup
