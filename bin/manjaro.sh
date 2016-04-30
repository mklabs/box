#! /usr/bin/bash

echo """

  Installing Manjaro Environment:

    i3-wm           - Tiling Window manager with great customization capability
    slim            - Login Manager realy slim
    rofi            - Run launcher

    termite         - Lightweight, keyboard centric terminal, tile friendly
    fish            - Awesome little shell like zsh, with great autocompletion feature
    fisherman       - Plugin manager for fish, oh-my-zsh equivalent for fish

    Arc theme       - A popular and well designed theme for Gnome
    Paper theme     - A popular and well designed theme for Gtk
    Roboto          - The Material Design font for System font
    Flattr Icon     - A set of high res icons
    Droid Sans Mono - The Material Design font for System font
    Font Awesome    - For the multitude of icons it provides

    neovim / vim    - Neovim if a fork that brings real async I/O and a great terminal emulator.

    chrome          - For browsing / frontend dev
    spotify         - Music player

"""

sleep 2

echo "Pacman upgrade ..."

sleep 1


# Update already installed packages
sudo dirmngr </dev/null
sudo pacman-key --init
sudo pacman-key --populate archlinux manjaro
sudo pacman-key --refresh-keys
sudo pacman -Syu

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


# Install the new ones
sudo pacmam --noconfirm -S $packages || exit 1

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
