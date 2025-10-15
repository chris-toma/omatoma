#!/bin/bash

echo "Installing Zsh..."

# Install zsh
sudo apt install -y zsh

# Install oh-my-zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s $(which zsh)
  echo "Zsh set as default shell (restart required)"
fi

echo "✓ Zsh installed"

