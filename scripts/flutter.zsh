#!/usr/bin/env zsh

set -e

source "$HOME/.zshrc"

# See https://github.com/RobotsAndPencils/xcodes
function install_xcodes() {
  if type xcodes >/dev/null; then
    echo "xcodes is already installed ✅ "
    return 0
  fi

  echo "Installing xcodes..."
  brew install xcodesorg/made/xcodes
  echo "Completed installing xcodes ✅ "
}

function install_xcode() {
  if [[ "$GITHUB_ACTIONS" == 'true' ]]; then
    return 0
  fi

  if xcodebuild -version &>/dev/null; then
    return 0
  fi

  # https://developer.apple.com/account にて、事前に Apple Developer Terms and Conditions を承諾する必要がある
  echo "Installing Xcode..."
  xcodes install --latest --select
  echo "Completed installing Xcode ✅ "
}

# See https://docs.flutter.dev/get-started/install/macos
function set_up_flutter() {
  if [[ "$GITHUB_ACTIONS" == 'true' ]]; then
    return 0
  fi

  if [[ $(uname -m) == 'arm64' ]]; then
    # See https://discussions.apple.com/thread/253780410
    # See https://discussions.apple.com/thread/254363637
    sudo softwareupdate --install-rosetta --agree-to-license
  fi
  sudo xcodebuild -runFirstLaunch
  sudo xcodebuild -license
}

install_xcodes
install_xcode
set_up_flutter
