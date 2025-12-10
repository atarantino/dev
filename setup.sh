#!/bin/bash
set -e

echo "Setting up dotfiles..."

# Add dotfiles alias to the appropriate shell rc file
ALIAS_LINE="alias dotfiles='git --git-dir=\$HOME/.dotfiles --work-tree=\$HOME/.config'"

if [[ "$SHELL" == *"zsh"* ]]; then
    RC_FILE="$HOME/.zshrc"
elif [[ "$SHELL" == *"bash"* ]]; then
    RC_FILE="$HOME/.bashrc"
else
    echo "Unknown shell: $SHELL - please add the alias manually"
    RC_FILE=""
fi

if [[ -n "$RC_FILE" ]]; then
    if ! grep -q "alias dotfiles=" "$RC_FILE" 2>/dev/null; then
        echo "$ALIAS_LINE" >> "$RC_FILE"
        echo "Added dotfiles alias to $RC_FILE"
    else
        echo "Dotfiles alias already exists in $RC_FILE"
    fi
fi

# Download zellij plugins
mkdir -p ~/.config/zellij/plugins

echo "Downloading zsm plugin..."
curl -sL -o ~/.config/zellij/plugins/zsm.wasm \
  "https://github.com/liam-mackie/zsm/releases/latest/download/zsm.wasm"

echo "Downloading harpoon plugin..."
curl -sL -o ~/.config/zellij/plugins/harpoon.wasm \
  "https://github.com/Nacho114/harpoon/releases/latest/download/harpoon.wasm"

echo "Done! Run 'source $RC_FILE' to use the dotfiles alias."
