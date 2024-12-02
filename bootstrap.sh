#!/usr/bin/env bash

EMACS_OPTS='--HEAD --with-starter --with-mac-metal --with-native-compilation --with-unlimited-select --with-modern-icon --with-librsvg'

REQUIRED_FORMULA=(
  bash-language-server
)

if ! type "brew" > /dev/null 2>&1; then
  echo "You must install Homebrew first and it must be available in your PATH."
  exit 1
fi

if ! brew ls -1 | grep 'emacs-mac' > /dev/null 2>&1; then
  PREFIX="/usr/local"
  if [[ "$(uname -p)" != "i386" ]]; then
    PREFIX="/opt"
  fi
  echo "Installing emacs-mac..."
  brew tap railwaycat/emacsmacport
  brew update
  brew install emacs-mac $EMACS_OPTS
  brew cleanup
  cp -a ${PREFIX}/homebrew/Cellar/emacs-mac/emacs-29.*/Emacs.app ~/Applications
fi

if [[ ! -f ~/.config/emacs/bin/doom ]]; then
  echo "Installing Doom Emacs..."
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
  ~/.config/emacs/bin/doom install
fi

echo "Done!"
