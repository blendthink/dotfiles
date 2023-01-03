#!/usr/bin/env zsh

if [[ $(type git) = *"homebrew"* ]]; then
  echo "Git is already installed ✅ "
else
  echo "Installing Git..."
  brew install git
  source "$HOME/.zprofile"
  echo "Completed installing Git ✅ "
fi
