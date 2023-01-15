#!/usr/bin/env zsh

if type brew >/dev/null; then
  echo "Homebrew is already installed ✅ "
else
  echo "Installing Homebrew..."
  # See https://brew.sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "Completed installing Homebrew ✅ "
fi

if grep -q '# Homebrew settings' "$HOME/.zprofile" &>/dev/null; then
  echo "Homebrew settings is already enabled ✅ "
else
  echo 'Enabling Homebrew settings...'
  if [[ $(uname -m) == 'arm64' ]]; then
    cat <<'EOF' >>"$HOME/.zprofile"

# Homebrew settings
eval "$(/opt/homebrew/bin/brew shellenv)"
EOF
  else
    cat <<'EOF' >>"$HOME/.zprofile"

# Homebrew settings
eval "$(/usr/local/bin/brew shellenv)"
EOF
  fi
  source "$HOME/.zprofile"
  echo "Completed enabling Homebrew settings ✅ "
fi

echo "Upgrade Homebrew..."
brew upgrade
echo "Completed Upgrading Homebrew ✅ "
