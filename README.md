# Initial Bare Metal installation

## Install Ansible and git

### Pacman (Arch linux)

```console
noob@archlinux:~$ bash <(curl -s https://raw.githubusercontent.com/ssongin/bare_metal/main/ansible_setup/pacman.sh)
```

## Get system information

```console
noob@archlinux:~$ ansible-playbook system_info.yaml
```