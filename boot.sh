#!/bin/bash

set -e

ascii_art='  ____                   ____ _______     __
 / __ \___  ____  ____ _/ __ /_  __/ |   / /
/ / / / _ \/ __ \/ __ / / / /  / /  | |/ / 
/ /_/ /  __/ / / / /_/ / /_/ /  / /   |   /  
\____/\___/_/ /_/\__,_/\____/  /_/    |_/   
'

echo -e "$ascii_art"
echo "=> Omatoma Setup for Development Environment!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omatoma..."
rm -rf ~/.local/share/omatoma
git clone https://github.com/chris-toma/omatoma.git ~/.local/share/omatoma >/dev/null
if [[ $OMATOMA_REF != "main" ]]; then
	cd ~/.local/share/omatoma
	git fetch origin "${OMATOMA_REF:-main}" && git checkout "${OMATOMA_REF:-main}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omatoma/install.sh

