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

# See https://github.com/RobotsAndPencils/xcodes
function install_xcodes() {
  if type xcodes >/dev/null; then
    echo "xcodes is already installed ✅ "
    return 0
  fi

  echo "Installing xcodes..."
  brew install robotsandpencils/made/xcodes
  echo "Completed installing xcodes ✅ "

  return 0
}

install_fvm
install_xcodes
