#!/usr/bin/env zsh

# Homebrew completions
# See https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
#
# You may also need to forcibly rebuild zcompdump:
#   rm -f ~/.zcompdump; compinit
# Additionally, if you receive "zsh compinit: insecure directories" warnings when
# attempting to load these completions, you may need to run this:
#   chmod -R go-w "$(brew --prefix)/share"
function configure_homebrew_completions() {
  if grep -q '_brew' "$HOME/.zcompdump" &>/dev/null; then
    echo 'Homebrew completions is already enabled ✅ '
    return 0
  fi

  if grep -q '# Homebrew completions' "$HOME/.zshrc" &>/dev/null; then
    echo 'Homebrew completions is already setting ✅ '
  else
    echo 'Setting Homebrew completions...'
    cat <<'EOF' >>"$HOME/.zshrc"

# Homebrew completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  # -U : Prevent user-defined alias from being overwritten when loading built-in functions
  # -z : specify read in zsh format
  autoload -Uz compinit && compinit
fi
EOF
    echo "Completed setting Homebrew completions ✅ "
  fi

  echo 'Enabling Homebrew completions...'
  source "$HOME/.zshrc"
  echo "Completed enabling Homebrew completions ✅ "

  return 0
}

# See https://zsh.sourceforge.io/Doc/Release/Completion-System.html
function configure_completions() {
  if grep -q '# Completions' "$HOME/.zshrc" &>/dev/null; then
    echo 'Completions is already setting ✅ '
  else
    echo 'Setting completions...'
    cat <<'EOF' >>"$HOME/.zshrc"

# Completions
zstyle ':completion::complete:*' use-cache true # Enable completion cache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case-insensitive completion
setopt complete_in_word # Tab completion even while typing
setopt list_packed # Narrow display interval of completion list
EOF
    echo "Completed setting completions ✅ "
  fi

  echo 'Enabling completions...'
  source "$HOME/.zshrc"
  echo "Completed enabling completions ✅ "

  return 0
}

configure_homebrew_completions
configure_completions
