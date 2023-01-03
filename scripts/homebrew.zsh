#!/usr/bin/env zsh

if type brew >/dev/null; then
  echo "Homebrew is already installed ✅ "
else
  echo "Installing Homebrew..."
  # See https://brew.sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  if [[ $(uname -m) == 'arm64' ]]; then
    # shellcheck disable=SC2016
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME/.zprofile"
  else
    # shellcheck disable=SC2016
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >>"$HOME/.zprofile"
  fi
  source "$HOME/.zprofile"

  echo "Completed installing Homebrew ✅ "
fi

echo "Upgrade Homebrew..."
brew upgrade
echo "Completed Upgrading Homebrew ✅ "
