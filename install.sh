#!/bin/bash
set -e

# Error trap
trap 'echo "Omatoma installation failed! Retry by running: source ~/.local/share/omatoma/install.sh"' ERR

# Update system
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Install gum (required for interactive menus)
if ! command -v gum &> /dev/null; then
  echo "Installing gum..."
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
  echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
  sudo apt update
  sudo apt install -y gum
fi

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

