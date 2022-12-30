#!/usr/bin/env zsh

if type brew >/dev/null; then
  echo "Homebrew is already installed ✅ "
else
  echo "Installing Homebrew..."
  # See https://brew.sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "Completed installing Homebrew ✅ "
fi
