#!/bin/bash
set -e

# Function to get script directory (works even when piped)
get_script_dir() {
    if [[ "${BASH_SOURCE[0]}" != "" ]]; then
        # Normal execution - script is a file
        echo "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    else
        # Piped execution - download the entire repo to temp
        TEMP_DIR=$(mktemp -d)
        cd "$TEMP_DIR"
        echo "Downloading Omatoma..."
        wget -q https://github.com/chris-toma/omatoma/archive/main.tar.gz
        tar -xzf main.tar.gz
        echo "$TEMP_DIR/omatoma-main"
    fi
}

# Get the script directory
SCRIPT_DIR=$(get_script_dir)

# Display ASCII art
if [[ -f "$SCRIPT_DIR/ascii.sh" ]]; then
    source "$SCRIPT_DIR/ascii.sh"
else
    # Fallback ASCII art if file not found
    echo "  ____                   ____ _______     __"
    echo " / __ \___  ____  ____ _/ __ /_  __/ |   / /"
    echo "/ / / / _ \/ __ \/ __ / / / /  / /  | |/ / "
    echo "/ /_/ /  __/ / / / /_/ / /_/ /  / /   |   /  "
    echo "\____/\___/_/ /_/\__,_/\____/  /_/    |_/   "
fi
echo "=> Omatoma Setup for Development Environment!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# Install git if needed
sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Installation starting..."
source "$SCRIPT_DIR/install.sh"

