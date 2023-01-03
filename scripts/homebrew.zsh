#!/usr/bin/env zsh

if xcode-select -p >/dev/null; then
  # If your CommandLineTools are too outdated,
  # Update them from Software Update in System Preferences or run:
  #   softwareupdate --all --install --force
  # If that doesn't show you any updates, run:
  #   rm -rf "$(xcode-select -p)"
  #   xcode-select --install
  echo "CommandLineTools is already installed ✅ "
else
  echo "Installing CommandLineTools..."
  sudo xcode-select --install
  echo "Completed installing CommandLineTools ✅ "
fi

if type brew >/dev/null; then
  echo "Homebrew is already installed ✅ "
else
  echo "Installing Homebrew..."
  # See https://brew.sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  # shellcheck disable=SC2016
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME/.zprofile"
  source "$HOME/.zprofile"
  echo "Completed installing Homebrew ✅ "
fi

echo "Upgrade Homebrew..."
brew upgrade
echo "Completed Upgrading Homebrew ✅ "
