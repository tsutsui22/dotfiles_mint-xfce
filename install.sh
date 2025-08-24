#!/bin/bash
#
# Dotfiles Installation Script
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# It also handles nested directories.

# --- Configuration ---
# The directory where your dotfiles are stored
dir=~/dotfiles
# A directory to back up any existing dotfiles to
olddir=~/dotfiles_old
# List of files/folders to symlink.
# IMPORTANT: Use the path relative to the dotfiles directory!
files=(
    ".Xmodmap"
    ".config/autostart/xmodmap.desktop"
    # --- Add other files here, e.g., ".bashrc", ".config/nvim/init.vim" ---
)

# --- Script Logic ---
echo "Starting dotfiles installation..."

# Create backup directory
echo "Creating backup directory for existing dotfiles at $olddir"
mkdir -p "$olddir"

# Change to the dotfiles directory
cd "$dir"

# Loop through the files to be symlinked
for file in "${files[@]}"; do
    source_file="$dir/$file"
    target_file="$HOME/$file"
    target_dir=$(dirname "$target_file")

    # Check if the source file actually exists in your repo
    if [ ! -e "$source_file" ]; then
        echo "ERROR: Source file does not exist: $source_file"
        continue
    fi

    # If the target file/link already exists, back it up
    if [ -f "$target_file" ] || [ -h "$target_file" ]; then
        echo "Backing up existing file: $target_file"
        mv "$target_file" "$olddir/"
    fi

    # Create the parent directory for the symlink if it doesn't exist
    echo "Ensuring target directory exists: $target_dir"
    mkdir -p "$target_dir"

    # Create the symlink
    echo "Creating symlink: $target_file -> $source_file"
    ln -s "$source_file" "$target_file"
done

echo "-------------------------------------"
echo "Dotfiles installation complete!"
echo "-------------------------------------"