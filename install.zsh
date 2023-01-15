#!/usr/bin/env zsh

SCRIPTS_URL="https://raw.githubusercontent.com/blendthink/dotfiles/main/scripts"

curl -fsSL "$SCRIPTS_URL/command-line-tools.zsh" | zsh
curl -fsSL "$SCRIPTS_URL/homebrew.zsh" | zsh
curl -fsSL "$SCRIPTS_URL/git.zsh" | zsh
curl -fsSL "$SCRIPTS_URL/completions.zsh" | zsh
curl -fsSL "$SCRIPTS_URL/suggestions.zsh" | zsh
curl -fsSL "$SCRIPTS_URL/flutter.zsh" | zsh
