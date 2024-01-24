#!/bin/bash

# For examples of wildcard characters and regular expressions,
# please refer to:
# https://www.runoob.com/regexp/regexp-intro.html
# https://support.microsoft.com/en-us/office/examples-of-wildcard-characters-939e153f-bd30-47e4-a763-61897c87b3f4
# 
# Examples of usage:
# cuecard dog

VERSION="0.1"

# Check if at least one parameter is passed
if [ "$#" -eq 0 ]; then
    printf "Usage: $(basename "$0" .sh) <search_term> \n"
    exit 1
fi

# Display help information
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    printf "Search for examples of the specified Linux command in the notes using \`grep\`. \n"
    printf "Usage: $(basename "$0" .sh) <search_term> \n"
    exit 0
fi

# Display version information
if [ "$1" == "--version" ] || [ "$1" == "-v" ]; then
    modification_time=$(stat -c %y "$0" | awk -F. '{print $1}')
    printf "$(basename "$0" .sh) $VERSION \t"
    printf "Last modified on: $modification_time \n"
    exit 0
fi

# Execute `grep` to search for the given string in `linux_commands.md`
search_results=$(grep -r "$1" "$HOME/cuecard/linux_commands.md")

# Check if there are any matches
if [ -z "$search_results" ]; then
    printf "No matches found for "$1". \n"
else
    echo "$search_results"
fi

