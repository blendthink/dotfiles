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
  zoom \
  1password \
  1password-cli

# See https://github.com/mas-cli/mas
#
# Required:
# - Sign in with Apple ID
# - Install at least one app from App Store
#
# 1352778147  Bitwarden
# 1482454543  Twitter
# 540348655   Monosnap
# 803453959   Slack
# 539883307   LINE
mas install \
  1352778147 \
  1482454543 \
  540348655 \
  803453959 \
  539883307