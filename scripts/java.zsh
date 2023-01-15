#!/usr/bin/env zsh

set -e

brew tap homebrew/cask-versions
brew install --cask \
  temurin8 \
  temurin11

if grep -q '# java path' "$HOME/.zshrc" &>/dev/null; then
  echo "java path is already setting ✅ "
else
  echo 'Setting java path...'
  cat <<'EOF' >>"$HOME/.zshrc"

# java path
JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)
JAVA_11_HOME=$(/usr/libexec/java_home -v 11)

export JAVA_8_HOME
export JAVA_11_HOME

alias java8='export JAVA_HOME=$JAVA_8_HOME ; PATH="${JAVA_HOME}/bin:${PATH}"'
alias java11='export JAVA_HOME=$JAVA_11_HOME ; PATH="${JAVA_HOME}/bin:${PATH}"'
EOF
fi
echo "Completed setting java path ✅ "

echo 'Enabling java...'
source "$HOME/.zshrc"
echo "Completed enabling java ✅ "
