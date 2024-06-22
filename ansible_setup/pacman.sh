#!/bin/bash

echo -e "\nInstalling pythonspipx package\n"
pacman -S --noconfirm python-pipx

echo -e "\nInstalling git package\n"
sudo pacman -S --noconfirm  git -y

echo -e "\nInstalling ansible via pip\n"
pipx install --include-deps ansible

echo -e "\nConfiguring path for ansible\n"
pipx ensurepath
pipx completions