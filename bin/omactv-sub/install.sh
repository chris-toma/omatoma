#!/bin/bash

CHOICES=(
  "SSH Key      Generate new GitHub SSH key"
  "GoLand       Install GoLand IDE"
  "Cursor       Install Cursor editor"
  "Zsh Plugins  Install additional zsh plugins"
  "<< Back      "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 7 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  echo ""
else
  INSTALLER=$(echo "$CHOICE" | awk '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
  INSTALLER_FILE="$OMACTV_PATH/install/app-$INSTALLER.sh"
  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMACTV_PATH/bin/omactv

