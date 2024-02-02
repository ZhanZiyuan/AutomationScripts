#!/bin/bash

# Check if at least one parameter is passed
if [ "$#" -eq 0 ]; then
    printf "Usage: $0 <directory> \n"
    exit 1
fi

# Accept one parameter of directory
directory=$1

# Check if the input directory exists
if [ ! -d "$directory" ]; then
    printf "Directory not found: $directory \n"
    exit 1
fi

# Initialize `file_count`
file_count=0

# Find and run all Python scripts recursively
while IFS= read -r -d $'\0' path_of_each_file; do
    echo "+-----------------------+"
    echo "|"
    echo "|     Running "$path_of_each_file""
    echo "|"
    echo "+-----------------------+"
    python "$path_of_each_file"

    # Increment `file_count` using correct syntax
    ((file_count++))
done < <(find "$directory" -type f -name "*.py" -print0)

# Print the total number of files run
printf "The number of files run: "$file_count" \n"
