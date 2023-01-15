#!/usr/bin/env zsh

set -e

if xcrun --version >/dev/null; then
  # If your CommandLineTools are too outdated,
  # Update them from Software Update in System Preferences or run:
  #   softwareupdate --all --install --force
  # If that doesn't show you any updates, run:
  #   sudo rm -rf "$(xcode-select -p)"
  #   xcode-select --install
  echo "CommandLineTools is already installed ✅ "
else
  echo "Installing CommandLineTools..."
  xcode-select --install
  echo "Completed installing CommandLineTools ✅ "
fi
