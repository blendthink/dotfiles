#!/usr/bin/env zsh

# FYI:
# - https://macos-defaults.com

set -e

# Battery
defaults -currentHost write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Clock
defaults write com.apple.menuextra.clock.plist "ShowSeconds" -bool true

# DS_Store
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
sudo defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
killall Finder

# Finder
defaults write com.apple.finder AnimateWindowZoom -bool false
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder WarnOnEmptyTrash -bool false
killall Finder

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.dock wvous-br-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 13
killall Dock
