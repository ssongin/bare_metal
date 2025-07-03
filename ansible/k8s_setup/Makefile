# Default target
all:

# Install
prepare:
	ansible-playbook prepare_server.yaml --ask-become-pass --ask-pass

# Setup
setup_k3s:
	ansible-playbook setup_k3s_cluster.yaml --ask-become-pass --ask-pass -vv
setup_k8s:
	ansible-playbook setup_k8s_cluster.yaml --ask-become-pass --ask-pass

omv_install:
	ansible-playbook omv_install.yaml --ask-become-pass --ask-pass

packages:
	ansible-playbook packages.yaml --ask-become-pass --ask-pass

reboot:
	ansible-playbook reboot.yaml --ask-become-pass --ask-pass

# Shutdown
shutdown:
	ansible-playbook shutdown.yaml --ask-become-pass --ask-pass

# Reset cluster
reset_k8s:
	ansible-playbook reset_k8s_cluster.yaml --ask-become-pass --ask-pass

# Help message
help:
	@echo "Usage:"
	@echo "  make prepare				# Prepare server for Kubernetes cluster installation"
	@echo "  make setup_k3s			# Install K3s cluster"
	@echo "  make setup_k8s			# Configure control and nodes for Kubernetes cluster"
	@echo "  make reset_k8s			# Reset cluster to initial configuriation"
	@echo "  make omv_install			# Install OpenMediaVault on Debian based machine"
	@echo "  make packages				# Apply packages to k8s machines"
	@echo "  make reboot				# Reboot all machines"
	@echo "  make shutdown				# Shutdown all machines"
