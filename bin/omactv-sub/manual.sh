#!/bin/bash

cat <<EOF
OmacTV - Development Environment Setup

Commands:
  omactv           - Open interactive menu
  
Menu Options:
  Update           - Update OmacTV or individual applications
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
  ~/.local/share/omactv/

For more information, visit the documentation.
EOF

read -p "Press Enter to return to menu..."
source $OMACTV_PATH/bin/omactv-sub/menu.sh

