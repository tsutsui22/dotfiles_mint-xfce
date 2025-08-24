#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# The directory where your dotfiles are
dir=~/dotfiles

# List of files/folders to symlink
files=".Xmodmap " # Add other config files here

echo "Moving any existing dotfiles from ~ to ~/dotfiles_old directory"
mkdir -p ~/dotfiles_old
for file in $files; do
    if [ -f ~/$file ] || [ -h ~/$file ]; then
        mv ~/$file ~/dotfiles_old/
        echo "Moved ~/$file to ~/dotfiles_old"
    fi
done
echo "...done"

echo "Creating symlinks to dotfiles in home directory"
for file in $files; do
    echo "Creating symlink for $file in home directory."
    ln -s $dir/$file ~/$file
done
echo "...done"
