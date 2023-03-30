#!/usr/bin/env bash

echo "1. Setup Brew"
# echo -ne | eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew doctor
# brew update

# TODO backup old files
echo "2. Remove old dotfiles"
rm -rf ~/.zshrc
rm -r ~/.gitconfig

echo "3. Setup symlinks"
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig