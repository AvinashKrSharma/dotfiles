# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### --- General Zsh Options ---
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
setopt autocd
setopt correct
setopt prompt_subst

### --- PATH ---
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

### --- Install Dependencies if Needed ---
# Create base plugin dir
mkdir -p "$HOME/.zsh"

# 1. Powerlevel10k
if [[ ! -d "$HOME/powerlevel10k" ]]; then
  echo "🔧 Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/powerlevel10k"
fi

# 2. zsh-autosuggestions
if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
  echo "🔧 Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
fi

# 3. zsh-syntax-highlighting
if [[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]]; then
  echo "🔧 Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.zsh/zsh-syntax-highlighting"
fi

### --- Prompt: Powerlevel10k ---
if [[ -r "$HOME/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
fi
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

### --- Git Aliases ---
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gco='git checkout'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcm='git commit -m'
alias glol='git log --graph --oneline --decorate --color'
alias gb='git branch'
alias gd='git diff'

### --- Autocomplete + Syntax Highlighting ---
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
bindkey '^ ' autosuggest-accept

### --- FZF ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

### --- Custom Dotfile Sourcing ---
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.extras" ] && source "$HOME/.extras"
