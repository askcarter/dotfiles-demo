#!/bin/bash

set -euo pipefail

if command -v zsh >/dev/null; then
    sudo chsh -s $(command -v zsh) $USER
fi

if [ ! -d "$HOME/.zsh" ]; then
    mkdir -p "$HOME/.zsh"
fi

if [ ! -d "$HOME/.zsh/pure" ]; then
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

if ! command -v chemoi >/dev/null; then
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/askcarter/dotfiles-demo.git
fi

# echo "set -o vi" >> ~/.bashrc

exit 0
