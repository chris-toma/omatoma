#!/bin/bash
set -e

# Display ASCII art
source "$(dirname "$0")/ascii.sh"
echo "=> OmacTV Setup for Development Environment!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# Install git if needed
sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Installation starting..."
source "$(dirname "$0")/install.sh"

