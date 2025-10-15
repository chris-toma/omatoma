#!/bin/bash

CHOICES=(
  "Omatoma       Update Omatoma itself and run migrations"
  "GoLand       JetBrains Go IDE"
  "Cursor       AI-powered code editor"
  "Zsh          Install latest zsh plugins"
  "Tmux         Terminal multiplexer"
  "<< Back      "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 8 --header "Update applications")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  echo ""
elif [[ "$CHOICE" == "Omatoma"* ]]; then
  source $OMATOMA_PATH/bin/omatoma-sub/migrate.sh
else
  INSTALLER=$(echo "$CHOICE" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
  INSTALLER_FILE="$OMATOMA_PATH/install/app-$INSTALLER.sh"
  source $INSTALLER_FILE && gum spin --spinner globe --title "Update completed!" -- sleep 3
fi

clear
source $OMATOMA_PATH/bin/omatoma

