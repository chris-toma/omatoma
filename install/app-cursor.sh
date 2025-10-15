#!/bin/bash

echo "Installing Cursor..."

if [ -f /opt/cursor.appimage ]; then
  echo "Cursor is already installed"
else
  cd /tmp
  
  # Install dependencies
  sudo apt install -y fuse3 libfuse2t64 jq
  
  # Download Cursor
  curl -L "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl' | xargs curl -L -o cursor.appimage
  sudo mv cursor.appimage /opt/cursor.appimage
  sudo chmod +x /opt/cursor.appimage
  
  # Create desktop entry
  DESKTOP_FILE="/usr/share/applications/cursor.desktop"
  sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=/opt/cursor.appimage --no-sandbox
Icon=cursor
Type=Application
Categories=Development;IDE;
EOL
  
  echo "✓ Cursor installed successfully"
  cd -
fi

