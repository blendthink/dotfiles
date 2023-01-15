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

# See https://github.com/rbenv/rbenv
function install_rbenv() {
  if type rbenv >/dev/null; then
    echo "rbenv is already installed ✅ "
  else
    echo "Installing rbenv..."
    brew install rbenv ruby-build
    rbenv init
    echo "Completed installing rbenv ✅ "
  fi

  if grep -q '# rbenv path' "$HOME/.zshrc" &>/dev/null; then
    echo "rbenv path is already setting ✅ "
  else
    echo 'Setting rbenv path...'
    cat <<'EOF' >>"$HOME/.zshrc"

# rbenv path
eval "$(rbenv init - zsh)"
EOF
    echo "Completed setting rbenv path ✅ "
  fi

  echo 'Enabling rbenv...'
  source "$HOME/.zprofile"
  echo "Completed enabling rbenv ✅ "

  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash

  return 0
}

install_fvm
install_xcodes
install_rbenv
