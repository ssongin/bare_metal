# Default target
all:

# Install
prepare:
	ansible-playbook prepare_server.yaml --ask-become-pass --ask-pass

# Setup
setup:
	ansible-playbook setup_cluster.yaml --ask-become-pass --ask-pass

reboot:
	ansible-playbook reboot.yaml --ask-become-pass --ask-pass

# Shutdown
shutdown:
	ansible-playbook shutdown.yaml --ask-become-pass --ask-pass

# Reset cluster
reset:
	ansible-playbook reset_cluster.yaml --ask-become-pass --ask-pass

# Help message
help:
	@echo "Usage:"
	@echo "  make prepare				# Prepare server for Kubernetes cluster installation"
	@echo "  make setup				# Configure control and nodes for Kubernets cluster"
	@echo "  make reset				# Reset cluster to initial configuriation"
	@echo "  make reboot				# Reboot all machines"
	@echo "  make shutdown				# Shutdown all machines"
