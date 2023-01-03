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
  xcode-select --install
  echo "Completed installing CommandLineTools ✅ "
fi

INSTALL_DIR="$HOME/repos/blendthink/dotfiles"

if [ -d "$INSTALL_DIR" ]; then
  echo "Updating dotfiles..."
  git -C "$INSTALL_DIR" pull
  echo "Completed updating dotfiles ✅ "
else
  echo "Installing dotfiles..."
  git clone https://github.com/blendthink/dotfiles.git "$INSTALL_DIR"
  echo "Completed installing dotfiles ✅ "
fi

cd "$INSTALL_DIR" || exit

zsh scripts/homebrew.zsh
