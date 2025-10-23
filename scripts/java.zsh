#!/usr/bin/env zsh

set -e

source "$HOME/.zshrc"

if [[ $(uname -m) == 'arm64' ]]; then
  # Temurin requires Rosetta 2 to be installed
  sudo softwareupdate --install-rosetta --agree-to-license
fi

brew install --cask \
  temurin@11 \
  temurin@17

if grep -q '# java path' "$HOME/.zshrc" &>/dev/null; then
  echo "java path is already setting ✅ "
else
  echo 'Setting java path...'
  cat <<'EOF' >>"$HOME/.zshrc"

# java path
JAVA_11_HOME=$(/usr/libexec/java_home -v 11)
JAVA_17_HOME=$(/usr/libexec/java_home -v 17)

export JAVA_11_HOME
export JAVA_17_HOME

alias java11='export JAVA_HOME=$JAVA_11_HOME ; PATH="${JAVA_HOME}/bin:${PATH}"'
alias java17='export JAVA_HOME=$JAVA_17_HOME ; PATH="${JAVA_HOME}/bin:${PATH}"'
EOF
fi
echo "Completed setting java path ✅ "

echo 'Enabling java...'
source "$HOME/.zshrc"
echo "Completed enabling java ✅ "
