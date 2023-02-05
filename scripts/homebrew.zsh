#!/usr/bin/env zsh

set -e

# See https://brew.sh
function set_up_homebrew() {
  if type brew >/dev/null; then
    echo "Homebrew is already installed ✅ "
    return 0
  fi

  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "Completed installing Homebrew ✅ "

  if grep -q '# Homebrew path' "$HOME/.zshrc" &>/dev/null; then
    echo "Homebrew path is already setting ✅ "
  else
    echo 'Setting Homebrew path...'
    if [[ $(uname -m) == 'arm64' ]]; then
      cat <<'EOF' >>"$HOME/.zshrc"

# Homebrew path
eval "$(/opt/homebrew/bin/brew shellenv)"
EOF
    else
      cat <<'EOF' >>"$HOME/.zshrc"

# Homebrew path
eval "$(/usr/local/bin/brew shellenv)"
EOF
    fi
    echo "Completed setting Homebrew path ✅ "
  fi

  echo 'Enabling Homebrew...'
  source "$HOME/.zshrc"
  echo "Completed enabling Homebrew ✅ "
}

set_up_homebrew

echo "Upgrade Homebrew..."
brew upgrade
echo "Completed Upgrading Homebrew ✅ "
