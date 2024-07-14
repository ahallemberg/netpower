#!/bin/bash

if command -v wakeonlan &> /dev/null; then
  export WOL_CMD="wakeonlan"
elif command -v wol &> /dev/null; then
  export WOL_CMD="wol"
fi

