#!/bin/bash


# Check if we have the correct number of arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <hostname>"
    exit 1
fi

hostname="$1"

# Check if the hostname exists in the file
if ! grep -q "^$hostname;" "$DATA_FILE"; then
    echo "Error: Hostname '$hostname' not found"
    exit 1
fi

# Remove the line containing the hostname
temp_file=$(mktemp)
grep -v "^$hostname;" "$DATA_FILE" > "$temp_file"

# Check if any changes were made
if cmp -s "$DATA_FILE" "$temp_file"; then
    echo "Error: Failed to remove host"
    rm "$temp_file"
    exit 1
fi

mv "$temp_file" "$DATA_FILE"
