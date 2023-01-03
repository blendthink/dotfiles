#!/usr/bin/env zsh

SCRIPTS_URL="https://raw.githubusercontent.com/blendthink/dotfiles/main/scripts"

curl -fsSL "$SCRIPTS_URL/command-line-tools.zsh" | zsh
curl -fsSL "$SCRIPTS_URL/homebrew.zsh" | zsh
