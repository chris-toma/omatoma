#!/bin/bash
sudo apt remove -y tmux
pip3 uninstall -y tmuxp
rm -f ~/.tmux.conf
echo "✓ Tmux and tmuxp uninstalled"

