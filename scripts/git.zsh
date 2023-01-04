#!/usr/bin/env zsh

if [[ $(type git) = *"homebrew"* ]]; then
  echo "Git is already installed ✅ "
else
  echo "Installing Git..."
  brew install git
  source "$HOME/.zprofile"
  echo "Completed installing Git ✅ "
fi

if type gh >/dev/null; then
  echo "GitHub CLI is already installed ✅ "
else
  echo "Installing GitHub CLI..."
  brew install gh
  echo "Completed installing GitHub CLI ✅ "
fi

if type gpg >/dev/null; then
  echo "GnuPG is already installed ✅ "
else
  echo "Installing GnuPG..."
  brew install gnupg
  echo "Completed installing GnuPG ✅ "
fi

if type pinentry-mac >/dev/null; then
  echo "pinentry-mac is already installed ✅ "
else
  echo "Installing pinentry-mac..."
  brew install pinentry-mac
  echo "Completed installing pinentry-mac ✅ "
fi
