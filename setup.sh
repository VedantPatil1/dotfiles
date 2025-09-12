#!/bin/zsh

# Get the script directory (Zsh-compatible)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "📁 Script directory: $SCRIPT_DIR"

# --- Install Homebrew packages ---
echo "📦 Installing from Brewfile..."
brew bundle --file="$SCRIPT_DIR/Brewfile"

# --- Copy starship config ---
mkdir -p ~/.config
cp "$SCRIPT_DIR/starship.toml" ~/.config/starship.toml
echo "✨ Copied starship.toml to ~/.config"

# --- Setup .zshrc ---
touch ~/.zshrc
echo "source $SCRIPT_DIR/zsh/init.zsh" > ~/.zshrc
echo "✅ Linked zsh config"

# --- Reload shell ---
echo "🚀 Starting new zsh shell..."
exec zsh

