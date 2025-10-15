#!/bin/bash

echo "Installing Kanata..."

# Create kanata directory
mkdir -p ~/.local/share/kanata

# Copy binary and config
cp "$OMATOMA_PATH/kanata" ~/.local/share/kanata/
cp "$OMATOMA_PATH/kanata.kbd" ~/.local/share/kanata/

# Make binary executable
chmod +x ~/.local/share/kanata/kanata

# Create systemd user service directory
mkdir -p ~/.config/systemd/user

# Create systemd service file
cat > ~/.config/systemd/user/kanata.service << 'EOF'
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata
After=graphical-session.target

[Service]
Type=simple
ExecStart=%h/.local/share/kanata/kanata --cfg %h/.local/share/kanata/kanata.kbd
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

# Reload systemd user daemon
systemctl --user daemon-reload

# Enable the service
systemctl --user enable kanata.service

echo "✓ Kanata installed and configured"
echo "  - Binary: ~/.local/share/kanata/kanata"
echo "  - Config: ~/.local/share/kanata/kanata.kbd"
echo "  - Service: ~/.config/systemd/user/kanata.service"
echo ""
echo "To start kanata: systemctl --user start kanata"
echo "To stop kanata: systemctl --user stop kanata"
echo "To check status: systemctl --user status kanata"
echo ""
echo "Note: Kanata will start automatically on next login"
