#!/bin/bash

UNINSTALLER=$(gum file $OMATOMA_PATH/uninstall --height 8)
[ -n "$UNINSTALLER" ] && gum confirm "Run uninstaller?" && source $UNINSTALLER && gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
clear
source $OMATOMA_PATH/bin/omatoma

