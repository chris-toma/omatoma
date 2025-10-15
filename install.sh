#!/bin/bash
set -e

# Error trap
trap 'echo "OmacTV installation failed! Retry by running: source ~/.local/share/omactv/install.sh"' ERR

# Update system
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Run installers in sequence
OMACTV_PATH="$(dirname "$0")"
for installer in "$OMACTV_PATH/install"/*.sh; do 
  echo "Running $(basename $installer)..."
  source "$installer"
done

# Success message
echo ""
echo "✓ OmacTV installation complete!"
echo "Run 'omactv' to access the management menu"
echo ""

