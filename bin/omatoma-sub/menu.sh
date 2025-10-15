#!/bin/bash

if [ $# -eq 0 ]; then
  SUB=$(gum choose "Update" "Install" "Uninstall" "Manual" "Quit" --height 8 --header "" | tr '[:upper:]' '[:lower:]')
else
  SUB=$1
fi

[ -n "$SUB" ] && [ "$SUB" != "quit" ] && source $OMATOMA_PATH/bin/omatoma-sub/$SUB.sh

