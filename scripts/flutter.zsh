#!/usr/bin/env zsh

# See https://fvm.app
function install_fvm() {
  if type fvm >/dev/null; then
    echo "FVM is already installed ✅ "
    return 0
  fi

  echo "Installing FVM..."
  brew tap leoafarias/fvm
  brew install fvm
  echo "Completed installing FVM ✅ "

  return 0
}

install_fvm
