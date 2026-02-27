#!/bin/bash

# =============================================================================
# macOS Setup Script (idempotent — safe to run multiple times)
# =============================================================================

DOTFILES="$HOME/dotfiles"

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# -----------------------------------------------------------------------------
# Core tools (brew skips already-installed formulae)
# -----------------------------------------------------------------------------
echo "Installing core tools..."
brew install git neovim ripgrep fzf fnm ghostty
brew install --cask font-meslo-lg-nerd-font 2>/dev/null || true

# -----------------------------------------------------------------------------
# Node via fnm
# -----------------------------------------------------------------------------
eval "$(fnm env)"
fnm install --lts
fnm default lts-latest

# -----------------------------------------------------------------------------
# Create vim directories
# -----------------------------------------------------------------------------
mkdir -p "$HOME/.vim/tmp"

# -----------------------------------------------------------------------------
# Symlinks (re-creates if exists, backs up non-symlink files)
# -----------------------------------------------------------------------------
echo "Creating symlinks..."

link() {
  local src="$DOTFILES/$1"
  local dest="$2"
  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -f "$dest" ]; then
    mv "$dest" "${dest}.bak"
    echo "  Backed up existing $dest to ${dest}.bak"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "  $dest -> $src"
}

link "zshrc"           "$HOME/.zshrc"
link "vimrc"           "$HOME/.vimrc"
link "aliases"         "$HOME/.aliases"
link "settings.json"   "$HOME/Library/Application Support/Code/User/settings.json"
link "keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
link "ghostty-config"  "$HOME/.config/ghostty/config"

# Neovim reads from ~/.config/nvim — point it to ~/.vim
if [ ! -L "$HOME/.config/nvim" ]; then
  mkdir -p "$HOME/.config"
  ln -s "$HOME/.vim" "$HOME/.config/nvim"
  echo "  ~/.config/nvim -> ~/.vim"
fi

# -----------------------------------------------------------------------------
# Neovim plugins
# -----------------------------------------------------------------------------
echo "Installing Neovim plugins..."
nvim --headless +PlugInstall +qall 2>/dev/null

# -----------------------------------------------------------------------------
# Done
# -----------------------------------------------------------------------------
echo ""
echo "Setup complete. Open Ghostty to start using your config."
