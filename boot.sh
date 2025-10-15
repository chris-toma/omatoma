#!/bin/bash
set -e

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Display ASCII art
source "$SCRIPT_DIR/ascii.sh"
echo "=> Omatoma Setup for Development Environment!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# Install git if needed
sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Installation starting..."
source "$SCRIPT_DIR/install.sh"

