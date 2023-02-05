#!/usr/bin/env zsh

set -e

if [[ $(type git) = *"homebrew"* ]]; then
  echo "Git is already installed ✅ "
else
  echo "Installing Git..."
  brew install git
  source "$HOME/.zshrc"
  echo "Completed installing Git ✅ "
fi

if type gh >/dev/null; then
  echo "GitHub CLI is already installed ✅ "
else
  echo "Installing GitHub CLI..."
  brew install gh
  echo "Completed installing GitHub CLI ✅ "
fi

if type gpg >/dev/null; then
  echo "GnuPG is already installed ✅ "
else
  echo "Installing GnuPG..."
  brew install gnupg
  echo "Completed installing GnuPG ✅ "
fi

if type pinentry-mac >/dev/null; then
  echo "pinentry-mac is already installed ✅ "
else
  echo "Installing pinentry-mac..."
  brew install pinentry-mac
  echo "Completed installing pinentry-mac ✅ "
fi

mkdir -p "$HOME/.gnupg" && chmod 700 "$HOME/.gnupg"
echo "pinentry-program $(which pinentry-mac)" >"$HOME/.gnupg/gpg-agent.conf"
gpgconf --kill gpg-agent

if $CI; then
  gpg --no-tty --pinentry-mode loopback --passphrase passwd --quick-gen-key "Tatsuya Okayama <admin@blendthink.dev>" default default 0
else
  gpg --quick-gen-key "Tatsuya Okayama <admin@blendthink.dev>" default default 0
fi

GPG_KEY_ID=$(gpg --list-secret-keys --with-colons | awk -F: '$1 == "sec" {print $5}' | tail -n 1)
GPG_PUBLIC_KEY=$(gpg --armor --export "$GPG_KEY_ID")

if ! $CI; then
  yes | gh auth login -h github.com -s admin:gpg_key -p https -w
  gh api \
    --method POST \
    -H "Accept: application/vnd.github+json" \
    /user/gpg_keys \
    -f name="blendthink's GPG Key" \
    -f armored_public_key="$GPG_PUBLIC_KEY"
fi

git config --global init.defaultBranch main
git config --global user.name blendthink
git config --global user.email admin@blendthink.dev
git config --global user.signingkey "$GPG_KEY_ID"
git config --global commit.gpgsign true
git config --global gpg.program "$(which gpg)"

GIT_CONFIG_DIR="$HOME/.config/git"
mkdir -p "$GIT_CONFIG_DIR"
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore -o "$GIT_CONFIG_DIR/ignore"
