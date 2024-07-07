#!/bin/bash

echo -e "\nInstalling pythonspipx package\n"
sudo pacman -S --noconfirm python-pipx

echo -e "\nInstalling git package\n"
sudo pacman -S --noconfirm  git -y

echo -e "\nInstalling ansible via pip\n"
pipx install --include-deps ansible

echo -e "\nConfiguring path for ansible\n"
pipx ensurepath
pipx completions

echo -e "\nCreate \"Projects\" directory\n"
mkdir ~/Projects

echo -e "\nClone this (Bare metal) repo\n"
cd ~/Projects
git clone --recurse-submodules https://github.com/ssongin/bare_metal.git