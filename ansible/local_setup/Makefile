# Default target
all:

server_reconfig:
	ansible-playbook prepare_cluster.yaml

# Prepare cluster servers for work
server_prepare:
	ansible-playbook prepare_cluster.yaml --ask-become-pass --ask-pass

# Install terminal packages
install_terminal:
	ansible-playbook cis.yaml --ask-become-pass --extra-vars "profile=terminal"

# Help message
help:
	@echo "Usage:"
	@echo "  make install_terminal		# Install terminal utilities"
	@echo "  make server_prepare			# Prepare cluster servers (Uses password)"
	@echo "  make server_reconfig			# Reconfigure cluster (Uses SSH key)"
