#!/bin/bash

UNINSTALLER=$(gum file $OMACTV_PATH/uninstall --height 8)
[ -n "$UNINSTALLER" ] && gum confirm "Run uninstaller?" && source $UNINSTALLER && gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
clear
source $OMACTV_PATH/bin/omactv

