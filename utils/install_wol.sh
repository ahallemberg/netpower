#!/bin/bash

if command -v apt &> /dev/null; then
  sudo apt-get install -y -qq wakeonlan
elif command -v dnf &> /dev/null; then
  sudo dnf install -y -q wol
elif command -v yum &> /dev/null; then
  sudo yum install -y wakeonlan
elif command -v pacman &> /dev/null; then
  sudo pacman -S --noconfirm wol
elif command -v zypper &> /dev/null; then
  sudo zypper install -y wakeonlan
elif command -v apk &> /dev/null; then
  sudo apk add wakeonlan
else
  exit 1
fi 



