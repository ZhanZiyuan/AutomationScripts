#!/bin/bash

# Define version information
VERSION="2.0.0"

# Define help information
HELP="WARNING: the cp command will overwrite the existing file with the same name.

Usage: $0 [OPTIONS] SOURCE_DIR TARGET_DIR EXTENSIONS...

Options:
    -h, --help      Display help information
    -v, --version   Display version information

Arguments:
    SOURCE_DIR      Path to be copied
    TARGET_DIR      Target path
    EXTENSIONS      File extensions, e.g., .py, .ipynb, .yaml

Example:
    $0 /home/user/yaml /home/user/backup .py .ipynb .yaml"

# Define the function to copy files
copy_specific_files() {
    local source_dir=$1
    local target_dir=$2
    shift 2
    local extensions=("$@")

    # If the target path does not exist, create it
    mkdir -p "$target_dir"

    echo "Starting to copy files from $source_dir..."

    # Iterate over the extensions and copy files
    for ext in "${extensions[@]}"; do
        find "$source_dir" -name "*$ext" | while read file; do
            # Get the relative path
            relative_path="${file#$source_dir}"

            # Create the necessary directories in the target path
            mkdir -p "$target_dir/$(dirname "$relative_path")"

            # Copy the file
            cp "$file" "$target_dir/$relative_path"
            echo "Copied file: $relative_path"
        done
    done

    echo "Finished copying files to $target_dir"
}

# Check parameters
if [[ $# -eq 0 ]]; then
    echo "$HELP"
    exit 1
fi

# Handle options
while (( $# )); do
    case $1 in
        -h|--help)
            echo "$HELP"
            exit 0
            ;;
        -v|--version)
            echo "$VERSION"
            exit 0
            ;;
        --) # end argument parsing
            shift
            break
            ;;
        -*|--*=) # unsupported flags
            echo "Error: Unsupported flag $1" >&2
            exit 1
            ;;
        *) # preserve positional arguments
            PARAMS="$PARAMS $1"
            shift
            ;;
    esac
done

# Set positional arguments in their proper place
eval set -- "$PARAMS"

# Check the number of parameters
if [ $# -lt 3 ]; then
    echo "Error: Insufficient number of parameters." >&2
    echo "$HELP"
    exit 1
fi

# Call the function to copy files
copy_specific_files "$@"
