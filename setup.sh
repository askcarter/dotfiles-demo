#!/bin/bash

set -euo pipefail

if command -v zsh >/dev/null; then
    sudo chsh -s $(command -v zsh) $USER
fi

if ! command -v chemoi >/dev/null; then
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/askcarter/dotfiles-demo.git
fi

# echo "set -o vi" >> ~/.bashrc

exit 0
