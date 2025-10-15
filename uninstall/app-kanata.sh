#!/bin/bash

echo "Uninstalling Kanata..."

# Stop and disable the service
systemctl --user stop kanata.service 2>/dev/null || true
systemctl --user disable kanata.service 2>/dev/null || true

# Remove service file
rm -f ~/.config/systemd/user/kanata.service

# Reload systemd user daemon
systemctl --user daemon-reload

# Remove kanata directory and files
rm -rf ~/.local/share/kanata

echo "✓ Kanata uninstalled"
