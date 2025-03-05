# Default target
all:

# Install
prepare:
	ansible-playbook prepare_server.yaml --ask-become-pass --ask-pass

# Setup
setup:
	ansible-playbook setup_cluster.yaml --ask-become-pass --ask-pass

# Help message
help:
	@echo "Usage:"
	@echo "  make prepare				# Prepare server for Kubernetes cluster installation"
	@echo "  make setup				# Configure control and nodes for Kubernets cluster"
