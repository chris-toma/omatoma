#!/bin/bash

echo "Setting up GitHub SSH key..."

if [ -f ~/.ssh/github ]; then
  echo "SSH key already exists at ~/.ssh/github"
  read -p "Press Enter to continue..."
else
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh
  
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/github -N "" -C "github-key"
  
  echo ""
  echo "=========================================="
  echo "Your GitHub SSH Public Key:"
  echo "=========================================="
  cat ~/.ssh/github.pub
  echo "=========================================="
  echo ""
  echo "Copy the key above and add it to GitHub:"
  echo "https://github.com/settings/ssh/new"
  echo ""
  read -p "✓ Press Enter after copying and adding the SSH key to GitHub..."
  
  # Add to SSH config
  if ! grep -q "Host github.com" ~/.ssh/config 2>/dev/null; then
    cat >> ~/.ssh/config <<EOF

Host github.com
  IdentityFile ~/.ssh/github
  User git
EOF
  fi
fi

