#!/bin/bash

set -euo pipefail

XDG_CONFIG_HOME="$HOME/.config"

if command -v zsh >/dev/null; then
  sudo chsh -s $(command -v zsh) $USER
fi

if [ ! -d "$HOME/.zsh" ]; then
  mkdir -p "$HOME/.zsh"
fi

if [ ! -d "$HOME/.zsh/pure" ]; then
  git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

if command -v alacritty >/dev/null; then
  mkdir -p "$XDG_CONFIG_HOME"/alacritty/themes
  git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes
fi

if ! command -v chemoi >/dev/null; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/askcarter/dotfiles-demo.git
fi

# echo "set -o vi" >> ~/.bashrc

exit 0
