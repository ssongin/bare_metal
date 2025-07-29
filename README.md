# Initial Bare Metal installation

## Passwords

root/root

## TODO

* lua cargo/rust?
* ansible roles changes required
  * change_password
    * move out username
    * move out password
  * configure_ssh
    * requires testing
    * move out public ssh
  * install_packages
    * instead of installing all packages change to install groups of packages
* separate ansible inventories required with variables
* docker-compose belongs to root/root, needs to be changed
* change user shell from bash to zsh
* yay repositories:
  * rclone-browser
  * archlinux-tweak-tool-git
  * anydesk
  * nvm
  * mission-center
  * cisco packet tracer packettracer
  * hyprshot
  * ttf-meslo-nerd-font-powerlevel10k
  * docker-desktop
  * lazydocker
* git applications:
  * sh -c "$(wget -O- <https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh>)"
* oh-my-zsh plugins:
  * git clone <https://github.com/zsh-users/zsh-syntax-highlighting.git> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  * git clone <https://github.com/zsh-users/zsh-autosuggestions.git> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
* oh-my-zsh themes:
  * git clone --depth=1 <https://github.com/romkatv/powerlevel10k.git> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

## Install Ansible and git

### Pacman (Arch linux)

```console
bash <(curl -s https://raw.githubusercontent.com/ssongin/bare_metal/main/ansible_setup/pacman.sh)
```

### Apt (Ubuntu)

```console
bash <(curl -s https://raw.githubusercontent.com/ssongin/bare_metal/main/ansible_setup/apt.sh)
```

## Ansible

### Description

Ansible playbooks are stored under ansible directory.

### Get system information

```console
ansible-playbook system_info.yaml
```

### Install packages

```console
ansible-playbook install_packages.yaml --ask-become-pass
```
