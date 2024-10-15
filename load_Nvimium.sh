#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# First delete old configs
rm -rf ~/.config/nvim/
sudo rm -rf ~/.local/share/nvim/
sudo rm -rf ~/.local/state/nvim/

# Delete neovim default themes
if [ -d "/usr/share/nvim/runtime/colors/" ]; then
    sudo rm -r /usr/share/nvim/runtime/colors/
fi

# Load new configs
cp -r "$SCRIPT_DIR/nvim/" ~/.config/
nvim # start neovim to load configs

# Note: csharp won't work out of the box, read the csharp.lua for more info
