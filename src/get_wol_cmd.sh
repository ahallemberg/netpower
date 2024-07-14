#!/bin/bash

if command -v wakeonlan &> /dev/null; then
  echo "wakeonlan"
elif command -v wol &> /dev/null; then
  echo "wol"
else
  exit 1
fi
