#!/usr/bin/env zsh

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
