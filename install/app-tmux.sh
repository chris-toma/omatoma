#!/bin/bash

echo "Installing Tmux..."

sudo apt install -y tmux

# Copy config if exists
if [ -f "$OMATOMA_PATH/configs/tmux.conf" ]; then
  cp "$OMATOMA_PATH/configs/tmux.conf" ~/.tmux.conf
fi

echo "✓ Tmux installed"

