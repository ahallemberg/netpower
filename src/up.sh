#!/bin/bash 

if [ $# -ne 1 ]; then
    echo "Usage: $0 <hostname>"
    exit 1
fi

hostname="$1"

# Check if the hostname exists in the file
mac_address=$(grep "^$hostname;" "$DATA_FILE" | cut -d';' -f2)

if [ -z "$mac_address" ]; then
    echo "Error: Hostname '$hostname' not found. Use netpower add [host-name] [mac-address] to add device"
    exit 1
fi

$WOL_CMD "$mac_address"

if [ $? -eq 0 ]; then
    echo "Wake-on-LAN packet sent successfully to $hostname ($mac_address)"
else
    echo "Error: Failed to send Wake-on-LAN packet to $hostname ($mac_address)"
    exit 1
fi
