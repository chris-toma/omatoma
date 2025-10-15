#!/bin/bash

echo "Installing Zsh plugins..."

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Clone plugins
declare -A plugins=(
  ["git-history"]="https://github.com/johnhamelink/git-history.git"
  ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
  ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions.git"
  ["zsh-vi-mode"]="https://github.com/jeffreytse/zsh-vi-mode.git"
  ["zsh-easy-motion"]="https://github.com/IngoHeimbach/zsh-easy-motion.git"
)

for plugin in "${!plugins[@]}"; do
  if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
    echo "Installing $plugin..."
    git clone "${plugins[$plugin]}" "$ZSH_CUSTOM/plugins/$plugin"
  else
    echo "$plugin already installed"
  fi
done

# Update .zshrc plugins
if [ -f ~/.zshrc ]; then
  # Add plugins if not present
  if ! grep -q "plugins=(git" ~/.zshrc; then
    sed -i 's/^plugins=.*/plugins=(git git-history zsh-syntax-highlighting zsh-autosuggestions zsh-vi-mode zsh-easy-motion)/' ~/.zshrc
  else
    # Just update the plugin list
    sed -i 's/^plugins=.*/plugins=(git git-history zsh-syntax-highlighting zsh-autosuggestions zsh-vi-mode zsh-easy-motion)/' ~/.zshrc
  fi
  
  # Source omatoma defaults
  if ! grep -q "source.*omatoma.*defaults" ~/.zshrc; then
    echo "" >> ~/.zshrc
    echo "# Omatoma defaults" >> ~/.zshrc
    echo "source ~/.local/share/omatoma/defaults/zsh/rc" >> ~/.zshrc
  fi
fi

echo "✓ Zsh plugins installed"

