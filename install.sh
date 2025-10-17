#!/bin/bash
set -e

# Error trap
trap 'echo "Omatoma installation failed! Retry by running: source ~/.local/share/omatoma/install.sh"' ERR

# Update system
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip


# Run installers in sequence
OMATOMA_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
for installer in "$OMATOMA_PATH/install"/*.sh; do 
  echo "Running $(basename $installer)..."
  source "$installer"
done

# Success message
echo ""
echo "✓ Omatoma installation complete!"
echo "Run 'omatoma' to access the management menu"
echo ""

