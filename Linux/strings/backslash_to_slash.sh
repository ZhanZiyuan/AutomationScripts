#!/bin/bash

# Convert backslashes to slashes
function backslash_to_slash {
    echo "$1" | tr '\\' '/'
}

# Check the number of arguments
if [ "$#" -lt 1 ]; then
    echo "Error: This script requires one argument."
    echo "Usage: $0 <Windows path>"
    exit 1
fi

backslash_to_slash "$1"
