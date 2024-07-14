#!/bin/bash

if command -v apt-get &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y wakeonlan
elif command -v dnf &> /dev/null; then
  sudo dnf install -y wakeonlan
elif command -v yum &> /dev/null; then
  sudo yum install -y wakeonlan
elif command -v pacman &> /dev/null; then
  sudo pacman -S --noconfirm wakeonlan
elif command -v zypper &> /dev/null; then
  sudo zypper install -y wakeonlan
else
  echo "Error: Unable to install wakeonlan. Please install it manually."
  exit 1
fi
