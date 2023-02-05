#!/usr/bin/env zsh

set -e

if $CI; then
  exit 0
fi

brew install \
  ffmpeg \
  graphviz \
  imagemagick \
  mas-cli/tap/mas \
  tree

brew install --cask \
  bitwarden \
  discord \
  docker \
  figma \
  fork \
  google-chrome \
  jetbrains-toolbox \
  notion \
  skitch \
  slack \
  slack-cli \
  stoplight-studio \
  xcodes \
  zoom \
  1password \
  1password-cli

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
