#!/bin/bash

echo "Installing Tmux..."

sudo apt install -y tmux

# Copy config if exists
if [ -f "$OMACTV_PATH/configs/tmux.conf" ]; then
  cp "$OMACTV_PATH/configs/tmux.conf" ~/.tmux.conf
fi

echo "✓ Tmux installed"

