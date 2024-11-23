#!/usr/bin/env zsh

# export environment variables
brew shellenv

# update homebrew
brew update

# upate installed formulae
brew upgrade

brew tap zegervdv/zathura
brew tap FelixKratz/formulae

# terminal programs
brew install bear
brew install borders
brew install girara --HEAD
brew install git
brew install helix
brew install iterm2
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai
brew install neovim
brew install pkg-config
brew install scc
brew install showkey
brew install sketchybar
brew install slides
brew install graph-easy
brew install spaceship
brew install zathura --HEAD
brew install zathura-pdf-poppler
brew install zsh-autocomplete
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
# language servers
brew install bash-language-server

# graphical applications
brew install --cask brave-browser
brew install --cask github
brew install --cask discord
brew install --cask mactex-no-gui

# fonts
brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font

# remove outdated versions
brew cleanup
