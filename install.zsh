#!/usr/bin/env zsh

set -e

TYPE=$1

if [[ "$TYPE" != "work" && "$TYPE" != "private" ]]; then
  echo "Error: Invalid argument. Please use 'work' or 'private'."
  exit 1
fi

SCRIPTS_URL="https://raw.githubusercontent.com/blendthink/dotfiles/main/scripts"

curl "$SCRIPTS_URL/defaults.zsh" | zsh
curl "$SCRIPTS_URL/command-line-tools.zsh" | zsh
curl "$SCRIPTS_URL/homebrew.zsh" | zsh
curl "$SCRIPTS_URL/git.zsh" | zsh
curl "$SCRIPTS_URL/completions.zsh" | zsh
curl "$SCRIPTS_URL/suggestions.zsh" | zsh
curl "$SCRIPTS_URL/java.zsh" | zsh
curl "$SCRIPTS_URL/flutter.zsh" | zsh
curl "$SCRIPTS_URL/rust.zsh" | zsh
curl "$SCRIPTS_URL/node.zsh" | zsh
curl "$SCRIPTS_URL/useful_tools.zsh" | zsh -s "$TYPE"
