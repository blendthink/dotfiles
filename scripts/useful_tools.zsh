#!/usr/bin/env zsh

set -e

if [[ "$GITHUB_ACTIONS" == 'true' ]]; then
  exit 0
fi

TYPE=$1

if [[ "$TYPE" != "work" && "$TYPE" != "private" ]]; then
  echo "Error: Invalid argument. Please use 'work' or 'private'."
  exit 1
fi

source "$HOME/.zshrc"

brew install \
  ffmpeg \
  graphviz \
  imagemagick \
  mas-cli/tap/mas \
  tree \
  jq \
  yq

brew install --cask \
  bitwarden \
  orbstack \
  figma \
  fork \
  google-chrome \
  jetbrains-toolbox \
  slack \
  xcodes \
  zoom \
  visual-studio-code

if [[ "$TYPE" != "private" ]]; then
  exit 0
fi

brew install --cask \
  discord \
  notion \
  cursor

# See https://github.com/mas-cli/mas
#
# Required:
# - Sign in with Apple ID
# - Install at least one app from App Store
#
# 1482454543  Twitter
# 540348655   Monosnap
# 539883307   LINE
mas install \
  1482454543 \
  540348655 \
  539883307
