#!/usr/bin/env zsh

if xcode-select -p >/dev/null; then
  # If your CommandLineTools are too outdated,
  # Update them from Software Update in System Preferences or run:
  #   softwareupdate --all --install --force
  # If that doesn't show you any updates, run:
  #   sudo rm -rf "$(xcode-select -p)"
  #   sudo xcode-select --install
  echo "CommandLineTools is already installed ✅ "
else
  echo "Installing CommandLineTools..."
  sudo xcode-select --install
  echo "Completed installing CommandLineTools ✅ "
fi
