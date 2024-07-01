#!/bin/bash

# Define the source directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "current script directory: $SCRIPT_DIR"

# Define the target directory
TARGET_DIR="$HOME/.config"

for item in "$SCRIPT_DIR"/dotfiles/*; do
    # Check if the current item is a directory
    if [ -d "$item" ]; then
        # Extract the relative path of the item
        rel_path=$(basename "$item")
        
        # Construct the full path for the symbolic link
        link_path="$TARGET_DIR/$rel_path"
        
        # Remove the existing symbolic link if it exists
        rm -rf "$link_path" || true
        
        # Create the symbolic link
        ln -s "$item" "$link_path"
        
        echo "Created symbolic link: $link_path"
    fi
done
