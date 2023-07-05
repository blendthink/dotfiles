#!/usr/bin/env zsh

set -e

source "$HOME/.zshrc"

# See https://www.rust-lang.org/tools/install
if type rustup >/dev/null; then
  echo "rustup is already installed ✅ "
else
  echo "Installing rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  echo "Completed installing rustup ✅ "
fi

if grep -q '# rustup path' "$HOME/.zshrc" &>/dev/null; then
  echo "rustup path is already setting ✅ "
else
  echo 'Setting rustup path...'
  cat <<'EOF' >>"$HOME/.zshrc"

# rustup path
source "$HOME/.cargo/env"
EOF
  echo "Completed setting rustup path ✅ "
fi

echo 'Enabling rustup...'
source "$HOME/.zshrc"
echo "Completed enabling rustup ✅ "

echo "Update rustup..."
rustup self update
rustup update

# See:
#   - https://doc.rust-lang.org/book/appendix-04-useful-development-tools.html
#   - https://rust-analyzer.github.io
# Check command:
#   rustup component list --installed
rustup component add \
  rustfmt clippy rust-analyzer rust-src rust-analysis rust-docs
echo "Completed updating rustup ✅ "

# Note:
#   rustup install {version}
#   rustup default {version}
