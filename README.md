# Initial Bare Metal installation

## Install Ansible and git

### Pacman (Arch linux)

```console
bash <(curl -s https://raw.githubusercontent.com/ssongin/bare_metal/main/ansible_setup/pacman.sh)
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

## Sync dotfiles

### Description
For dotfiles is used GNU stow. It creates synlinks from repo to provided places
Change directory to stow. Run commands:

### Neovim

```console
stow --target="$HOME" nvim
```

### Tmux

```console
stow --target="$HOME" tmux
```

### Alacritty 

```console
stow --target="$HOME" alacritty
```

### Starship 

```console
stow --target="$HOME" starship
```
