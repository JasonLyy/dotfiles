#!/usr/bin/env bash

#1. Setup Brew
echo -ne | eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew doctor
brew update
