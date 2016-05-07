#! /usr/bin/bash

echo """
  Installing Manjaro Environment:
"""


# Packages:
#
# List here every pacman packages to install on a fresh Manjaro distrib

packages=""

# Windows manager
packages+=" i3 i3blocks"

# Display manager
packages+=" slim slim-themes"

# run launcher
packages+=" rofi"

# Theme
packages+=" arc-themes paper-gtk-theme-git"
packages+=" flattr-icon-theme"
packages+=" ttf-roboto ttf-droid"
packages+=" otf-font-awesome"

# Text Editors
packages+=" vim"
packages+=" neovim python python-pip python-neovim"

# Terminal
packages+=" termite"
packages+=" fish"

# Browsers
packages+=" google-chrome"

# Spotify
packages+=" spotify"

# Finder (ack / grep like)
packages+=" the_silver_searcher"
packages+=" fzf"

# File jumper
packages+=" z-git"

# Misc
packages+=" tree curl xclip lxappearance feh stow thunar"

echo """

  Install packages:

  $packages

"""


echo "Pacman upgrade ..."

# Update already installed packages
sudo dirmngr </dev/null
sudo pacman-key --init
sudo pacman-key --populate archlinux manjaro
sudo pacman-key --refresh-keys
sudo pacman -Syu

# Install the new ones
yaourt --noconfirm -R pamac vte3
yaourt --noconfirm -S $packages || exit 1


# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
nvm install 6.0.0
nvm use 6.0.0

# Install fisherman
npm i fisherman -g

# pure theme
fisher rafaelrinaldi/pure
fisher edc/bass

# change default shell to fish
sudo chsh -s /usr/bin/fish

echo """

Installation succesful.

Reboot and enjoy.

"""
