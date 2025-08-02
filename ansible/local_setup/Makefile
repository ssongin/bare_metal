# Default target
all:

server_reconfig:
	ansible-playbook prepare_cluster.yaml

# Prepare cluster servers for work
server_prepare:
	ansible-playbook prepare_cluster.yaml --ask-become-pass --ask-pass

# Install all for windows
win_install:
	ansible-playbook win_install.yaml

# Install all
install:
	ansible-playbook cis.yaml --ask-become-pass

# Install base packages
install_base:
	ansible-playbook cis.yaml --ask-become-pass --extra-vars "profile=base"

# Install terminal packages
install_terminal:
	ansible-playbook cis.yaml --ask-become-pass --extra-vars "profile=terminal"

# Install hyprland packages
install_hyprland:
	ansible-playbook cis.yaml --ask-become-pass --extra-vars "profile=hyprland"

# Install desktop packages
install_desktop:
	ansible-playbook cis.yaml --ask-become-pass --extra-vars "profile=desktop"

# Install infrastructure packages
install_infra:
	ansible-playbook cis.yaml --ask-become-pass --extra-vars "profile=infrastructure"

install_sdk:
	ansible-playbook cis.yaml --ask-become-pass --extra-vars "profile=sdk"

# Help message
help:
	@echo "Usage:"
	@echo "  make install_base			# Install base packages"
	@echo "  make install_desktop			# Install desktop applications"
	@echo "  make install_hyprland			# Install hyprland packages"
	@echo "  make install_infra			# Install infrastructure packages"
	@echo "  make install_sdk			# Install sdk packages"
	@echo "  make install_terminal			# Install terminal utilities"
	@echo "  make install				# Install all packages"
	@echo "  make server_prepare			# Prepare cluster servers (Uses password)"
	@echo "  make server_reconfig			# Reconfigure cluster (Uses SSH key)"
	@echo "  make win_install				# Install all packages for Windows"
