#!/bin/bash

echo "Installing GoLand..."

if snap list goland &>/dev/null; then
  echo "GoLand is already installed"
else
  sudo snap install goland --classic
  echo "✓ GoLand installed successfully"
fi

