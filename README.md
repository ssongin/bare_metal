# Initial Bare Metal installation

## Passwords

root/root

## TODO

* lua cargo/rust?
* ansible roles changes required
  * configure_ssh
    * requires testing
  * install_packages
* change user shell from bash to zsh
* missing yay repositories from config:
  * rclone-browser
  * archlinux-tweak-tool-git
  * anydesk
  * nvm
  * mission-center
  * cisco packet tracer packettracer
  * hyprshot
  * ttf-meslo-nerd-font-powerlevel10k
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

## Packages
 
### Installation

#### Profiles

Packages can be installed in bulk by profile one by one. Also, if profile parameter is missing then all packages will be installed.

#### Archlinux

Installs "yay". Packages added via pacman, yay and pip.

#### Ubuntu/Debian

To install packages uses apt, snap and pip. Also there is separate file to add PPA repositories.

#### Windows

For installation ansible playbook uses chocolatey and pip. Additionally sets PATH parameters.

### Package list

#### Profile: base

| Package | Archlinux | Ubunut/Debian | Windows | Description |
| --- | --- | --- | --- | --- |
| base-devel/build-essential | ✓ | ✓  |  | Package group that includes tools needed for building (compiling and linking). |
| stow | ✓ | ✓ | | GNU Stow symlink farm manager |
| nfs-utils/nfs-common | ✓ | ✓ | | Support programs for Network File System |

#### Profile: sdk

| Package | Archlinux | Ubunut/Debian | Windows | Description |
| --- | --- | --- | --- | --- |
| git | | | ✓ | Version control system |
| maven | ✓ | ✓ | | Build management tool for Java |
| npm | ✓ | ✓ | | Node packet manager |
| nodejs | ✓ | ✓ | | JS runtime |
| python-pip | ✓ | | | Packet installer for python |
| python3-pip | | ✓ | | Packet installer for python |
| go/golang | ✓ | ✓ | ✓ | Golang compiler and development tools |
| sqlitebrowser | ✓ | ✓ | ✓ | Sqlite DB browser |
| code/visualstudiocode | ✓ | ✓ | ✓ | Visual Code text editor |

#### Profile: infrastructure

| Package | Archlinux | Ubunut/Debian | Windows | Description |
| --- | --- | --- | --- | --- |
| podamn | ✓ | ✓ | | Podman container service |
| docker/docker.io/docker-desktop | ✓ | ✓ | ✓ | Docker container service |
| docker-compose | ✓ | ✓ | ✓ | Container manager |
| terraform | ✓ | ✓ | ✓ | IaC tool |
| virtualbox-host-modules-arch | ✓ | | | VBox kernel interaction modules |
| virtualbox | ✓ | ✓ | ✓ | Virtualbox hypervisor |
| vagrant | | | ✓ | Command line utility for managing the lifecycle of virtual machines |
| kubectl/kubernetes-cli | ✓ | ✓ | ✓ | Console tool for Kubernetes API management |
| helm/kubernetes-helm | ✓ | ✓ | ✓ | Kubernetes packet manager |
| k9s | ✓ | ✓ | ✓ | TUI for managing Kubernetes cluster |
| minikube | ✓ | | ✓ | Local single node Kubernetes cluster |
| python-kubernetes | ✓ | | | Python wrapper around Kubernetes |
| rpi-image | ✓ | ✓ | ✓ | Raspberry Pi imager |
| sshpass | ✓ | ✓ | | Utility for Ansible remote pass connection |
| passlib | ✓ | ✓ | | Utility for Ansible to change passwords |
| pywinrm\[credssp\] | ✓ | ✓ | | Utility for Ansible WinRM connection |

#### Profile: terminal

| Package | Archlinux | Ubunut/Debian | Windows | Description |
| --- | --- | --- | --- | --- |
| wezterm | ✓ | ✓ | ✓ | Wezterm terminal emulator |
| kitty | ✓ | ✓ | | Kitty terminal emulator |
| zsh | ✓ | ✓ | | ZSH shell |
| zsh-completions | ✓ | | | Autocomplete for zsh |
| less | ✓ | ✓ | | Terminal pager |
| pacman-contrib | ✓ | | | Collection of tools that extends functionality of pacman |
| tmux | ✓ | ✓ | | Terminal multiplexer |
| neovim | ✓ | ✓ | ✓ | Text editor |
| lsd | ✓ | ✓ | | Analog for "ls" command |
| eza | ✓ | | | Analog for "ls" command |
| bat | ✓ | ✓ | | Analog for "cat" command |
| zoxide | ✓ | ✓ | | Analog for "cd" command |
| lazygit | ✓ | ✓ | ✓ | TUI for git |
| fzf | ✓ | ✓ | | Fuzzy finding utility |
| fd/fd-find | ✓ | ✓ | | Find utility |
| unzip | ✓ | ✓ | | ZIP archiving utility |
| lha | ✓ | | | LH-7 archiving utility |
| arj | ✓ | | | ARJ archiving utility |
| unarj | ✓ | | | ARJ archiving utility |
| unace | ✓ | ✓ | | ACE archiving utility |
| unrar | ✓ | ✓ | | RAR archiving utility |
| p7zip/p7zip-full | ✓ | ✓ | | ZIP archiving utility |
| luarocks | ✓ | ✓ | | Deployment and management system for lua |
| tree-sitter | ✓ | ✓ | | Incremental parsing library |
| net-tools | ✓ | ✓ | | Linux networking utilities |
| dnsutils | ✓ | ✓ | | Tool to query internet domain name servers |
| nmap | ✓ | ✓ | | Utility for network discovery and security auditing |
| tcpdump | ✓ | ✓ | | Network packet analyzer |
| cmus | ✓ | ✓ | | Console audio player |
| lazydocker | ✓ | | ✓ | TUI for docker |
| yazi | ✓ | ✓ | | Terimnal file explorer |
| ttf-meslo-nerd | ✓ | | | Meslo nerd fonts |
| ttf-dejavu | ✓ | | | Dejavu fonts for powerlevel10k |
| picom | ✓ | | | Lightweight compositor for X11 |

#### Profile: Desktop

| Package | Archlinux | Ubunut/Debian | Windows | Description |
| --- | --- | --- | --- | --- |
| thunderbird | ✓ | ✓ | ✓ | Mail, news, chat client from Mozilla |
| dolphin | ✓ | ✓ | | KDE file manager |
| krusader | ✓ | ✓ | | Advanced file manager |
| kdiff3 | ✓ | ✓ | | File comparator/merge tool |
| krename | ✓ | ✓ | | Batch file renamer |
| calibre | ✓ | ✓ | ✓ | E-book management system |
| drawio/drawio-desktop | ✓ | | ✓ | drawio.io tool for diagrams |
| firefox | ✓ | ✓ | ✓ | Web browser |
| keepass | ✓ | ✓ | ✓ | Password manager |
| rclone | ✓ | ✓ | | Sinchronization utility |
| qbittorrent | ✓ | ✓ | ✓ | Torrent transfer application |
| telegram/telegram-desktop | ✓ | ✓ | ✓ | Telegram messager service |
| discord | ✓ | ✓ | ✓ | Discord messager service |
| libreoffice-fresh | ✓ | | ✓ | Libre office suit application bundle |
| libreoffice | | ✓ | | Libre office suit application bundle |
| vlc | ✓ | ✓ | ✓ | Media player |
| gimp | ✓ | ✓ | ✓ | Image editor |
| krita | ✓ | ✓ | ✓ | Image editor |
| steam | ✓ | ✓ | ✓ | Game distribution service |
| pipewire | ✓ | ✓ | | Audio and video stream handler |
| lens/kontenta-lens | | ✓ | ✓ | The IDE for Kubernetes |

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
