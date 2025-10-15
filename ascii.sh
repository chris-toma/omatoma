#!/bin/bash

ascii_art='
  ____                   ____ _______     __
 / __ \___  ____  ____ _/ __ /_  __/ |   / /
/ / / / _ \/ __ \/ __ / / / /  / /  | |/ / 
/ /_/ /  __/ / / / /_/ / /_/ /  / /   |   /  
\____/\___/_/ /_/\__,_/\____/  /_/    |_/   
'

colors=(
  '\033[38;5;81m'  # Cyan
  '\033[38;5;75m'  # Light Blue
  '\033[38;5;69m'  # Sky Blue  
  '\033[38;5;63m'  # Dodger Blue
  '\033[38;5;57m'  # Deep Sky Blue
)

IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

for i in "${!lines[@]}"; do
  color_index=$((i % ${#colors[@]}))
  echo -e "${colors[color_index]}${lines[i]}"
done

