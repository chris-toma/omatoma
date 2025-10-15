#!/bin/bash

cat <<EOF
Omatoma - Development Environment Setup

Commands:
  omatoma           - Open interactive menu
  
Menu Options:
  Update           - Update Omatoma or individual applications
  Install          - Install additional components
  Uninstall        - Remove installed applications
  Manual           - Show this help message

Installed Components:
  - SSH Key (GitHub)
  - GoLand IDE
  - Cursor Editor
  - Zsh with oh-my-zsh and plugins
  - Tmux and Tmuxp

Configuration files are stored in:
  ~/.local/share/omatoma/

For more information, visit the documentation.
EOF

read -p "Press Enter to return to menu..."
source $OMATOMA_PATH/bin/omatoma-sub/menu.sh

