# Ansible playbooks for Proxmox

## Requirements

* Supported machine: Ubuntu

## Features

* Cleanup before creating template from Virtual Machine

## Inventory

__N.B.__ Copy or rename sample-inventory.yaml into inventory.yaml

## Usage

### Help

Provides list of available commands

``` sh
make help
```

### Cleanup before templating

Cleans Virtual Machine to prepare it for transformation into template.

``` sh
make cleanup
```

Currently supported only Ubuntu.

* Cleans APT, installs qemu-guest-agent and cloud-init.
* Removes SSH keys
* Uploads new SSH public key
* Removes Machine ID
* Cleans cloud-init
