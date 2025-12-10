#!/bin/bash
set -e

echo "Setting up dotfiles..."

# Download zellij plugins
mkdir -p ~/.config/zellij/plugins

echo "Downloading zsm plugin..."
curl -sL -o ~/.config/zellij/plugins/zsm.wasm \
  "https://github.com/dj95/zsm/releases/latest/download/zsm.wasm"

echo "Downloading harpoon plugin..."
curl -sL -o ~/.config/zellij/plugins/harpoon.wasm \
  "https://github.com/Nacho114/harpoon/releases/latest/download/harpoon.wasm"

echo "Done! Plugins installed."
