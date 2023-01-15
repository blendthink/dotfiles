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
}

function install_ruby() {
  echo "Installing Ruby..."
  latest_version=$(rbenv install -l | grep -v - | tail -1)
  rbenv install "$latest_version"
  rbenv global "$latest_version"
  echo "Completed installing Ruby ✅ "
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
}

function install_xcode() {
  echo "Installing Xcode..."
  latest_version=$(xcodes list | grep -v '[GM|Beta|Candidate]' | grep -o '^[0-9]\+\.[0-9]\+\.*[0-9]*')
  xcodes install "$latest_version"
  xcodes select "$latest_version"
  echo "Completed installing Xcode ✅ "
}

install_fvm
install_rbenv
install_ruby
install_xcodes
install_xcode
