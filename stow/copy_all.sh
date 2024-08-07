#!/bin/bash

echo -e "\nLinking alacritty\n"
stow --target="$HOME" alacritty

echo -e "\nLinking i3\n"
stow --target="$HOME" i3

echo -e "\nLinking nvim\n"
stow --target="$HOME" nvim

echo -e "\nLinking picom\n"
stow --target="$HOME" picom

echo -e "\nLinking polybar\n"
stow --target="$HOME" polybar

echo -e "\nLinking rofi\n"
stow --target="$HOME" rofi

echo -e "\nLinking starship\n"
stow --target="$HOME" starship

echo -e "\nLinking tmux\n"
stow --target="$HOME" tmux

echo -e "\nLinking private\n"
stow --target="$HOME" private