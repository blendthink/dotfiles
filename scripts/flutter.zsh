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
  brew install robotsandpencils/made/xcodes
  echo "Completed installing xcodes ✅ "
}

function install_xcode() {
  if [[ "$GITHUB_ACTIONS" == 'true' ]]; then
    return 0
  fi
  echo "Installing Xcode..."
  xcodes install --latest --select
  echo "Completed installing Xcode ✅ "
}

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
}

# See https://github.com/rbenv/rbenv
function install_rbenv() {
  if type rbenv >/dev/null; then
    echo "rbenv is already installed ✅ "
  else
    echo "Installing rbenv..."
    # See https://github.com/rbenv/ruby-build/discussions/2118
    brew install rbenv ruby-build libyaml
    echo "Completed installing rbenv ✅ "
  fi

  if grep -q '# rbenv path' "$HOME/.zshrc" &>/dev/null; then
    echo "rbenv path is already setting ✅ "
  else
    echo 'Setting rbenv path...'
    cat <<'EOF' >>"$HOME/.zshrc"

# rbenv path
if type rbenv >/dev/null; then
  eval "$(rbenv init - zsh)"
fi
EOF
    echo "Completed setting rbenv path ✅ "
  fi

  echo 'Enabling rbenv...'
  source "$HOME/.zshrc"
  echo "Completed enabling rbenv ✅ "

  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
}

function install_ruby() {
  echo "Installing Ruby..."
  latest_version=$(rbenv install -l | grep -v - | tail -1)
  rbenv install "$latest_version"
  rbenv global "$latest_version"
  echo "Completed installing Ruby ✅ "
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

  # If necessary:
  #   rbenv exec gem install cocoapods
  #   rbenv exec gem uninstall ffi & rbenv exec gem install ffi -- --enable-libffi-alloc
}

install_xcodes
install_xcode
install_fvm
install_rbenv
install_ruby
set_up_flutter
