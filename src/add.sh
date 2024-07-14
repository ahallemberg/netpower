#!/bin/bash 

if [ $# -ne 2 ]; then
    echo "Usage: $0 <hostname|IP> <MAC address>"
    exit 1
fi

host="$1"
mac="$2"

# Validate MAC address format
if ! echo "$mac" | grep -E "^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$" > /dev/null; then
    echo "Invalid MAC address format. Please use XX:XX:XX:XX:XX:XX"
    exit 1
fi

# Check if the hostname already exists
if grep -q "^$host;" "$DATA_FILE"; then
    echo "Error: Hostname '$host' already exists"
    exit 1
fi

# Check if the MAC address already exists
if grep -q ";$mac$" "$DATA_FILE"; then
    echo "Error: MAC address '$mac' already exists"
    exit 1
fi

echo "$host;$mac" >> "$DATA_FILE"
