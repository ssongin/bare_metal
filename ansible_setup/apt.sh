#!/bin/bash

echo -e "\nInstalling pipx package\n"
sudo apt update
sudo apt install -y pipx

# Some systems require this symlink to make pipx accessible right away
export PATH="$HOME/.local/bin:$PATH"

echo -e "\nInstalling git package\n"
sudo apt install -y git

echo -e "\nInstalling ansible via pipx\n"
pipx install --include-deps ansible

echo -e "\nConfiguring path for ansible\n"
pipx ensurepath
pipx completions

echo -e "\nCreate \"Projects\" directory\n"
mkdir -p ~/Projects

echo -e "\nClone this (Bare metal) repo\n"
cd ~/Projects
git clone --recurse-submodules https://github.com/ssongin/bare_metal.git
