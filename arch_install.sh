#!/bin/bash

# Installation script for new OS installs
# Installs my setup for Arch-based OSes
# Austin Bricker, 2018

# Checks if git is installed
if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed. Please install git before proceeding.";
    exit 1;
fi

echo "Arch Installation";
echo "Updating pacman packages";
sudo pacman -Syu;
echo "Installing new packages";
sudo pacman -S neofetch pandoc tmux vim yaourt;

echo "Moving dotfiles into place";
cp .bashrc ~;
cp .bash_profile ~;
cp .aliases ~;
cp .tmux.conf ~;

source $HOME/.bash_profile;

# Install vim presets
if ! command -v vim >/dev/null; then
    sh ./vim_install.sh;
if

echo "Your installation is complete!";
