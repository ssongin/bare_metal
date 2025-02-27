# Ansible playbooks for Proxmox

## TODO

* Upload SSH public key

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
* Removes Machine ID
