#!/usr/bin/env zsh

set -e

# See https://github.com/nodenv/nodenv
if type nodenv >/dev/null; then
  echo "nodenv is already installed ✅ "
else
  echo "Installing nodenv..."
  brew install nodenv
  echo "Completed installing nodenv ✅ "
fi

if grep -q '# nodenv path' "$HOME/.zshrc" &>/dev/null; then
  echo 'nodenv path is already setting ✅ '
else
  echo 'Setting nodenv path...'
  cat <<'EOF' >>"$HOME/.zshrc"

# nodenv path
if type nodenv >/dev/null; then
  eval "$(nodenv init -)"
fi
EOF
  echo "Completed setting nodenv path ✅ "
fi

echo 'Enabling nodenv...'
source "$HOME/.zshrc"
echo "Completed enabling nodenv ✅ "

curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
