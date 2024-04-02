
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# First delete old configs
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Load new configs
cp -r "$SCRIPT_DIR/nvim/" ~/.config/
nvim        # start nvim to load configs
