#!/usr/bin/env zsh

# See https://github.com/zsh-users/zsh-autosuggestions
if brew list | grep zsh-autosuggestions &>/dev/null; then
  echo "zsh-autosuggestions is already installed ✅ "
else
  echo "Installing zsh-autosuggestions..."
  brew install zsh-autosuggestions
  echo "Completed installing zsh-autosuggestions ✅ "
fi

if grep -q '# zsh-autosuggestions' "$HOME/.zshrc" &>/dev/null; then
  echo 'zsh-autosuggestions is already setting ✅ '
else
  echo 'Setting zsh-autosuggestions...'
  cat <<'EOF' >>"$HOME/.zshrc"

# zsh-autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
EOF
  echo "Completed setting zsh-autosuggestions ✅ "
fi

echo 'Enabling zsh-autosuggestions...'
source "$HOME/.zshrc"
echo "Completed enabling zsh-autosuggestions ✅ "
