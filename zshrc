# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### --- Options ---
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
setopt autocd
setopt correct
setopt prompt_subst

### --- History ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
HIST_STAMPS="dd/mm/yyyy"
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

### --- Plugins (zinit) ---
if [[ ! -f "${ZDOTDIR:-$HOME}/.zinit/bin/zinit.zsh" ]]; then
  mkdir -p "${ZDOTDIR:-$HOME}/.zinit"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZDOTDIR:-$HOME}/.zinit/bin"
fi
source "${ZDOTDIR:-$HOME}/.zinit/bin/zinit.zsh"

zinit ice depth=1
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

autoload -Uz compinit && compinit

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
bindkey '^ ' autosuggest-accept

### --- Aliases ---
alias gs='git status'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gco='git checkout'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcb='git checkout -b'
alias gclean='git clean -fd'
alias gcm='git commit -m'
alias gdca='git diff --cached'
alias glol='git log --graph --oneline --decorate --color'
alias gb='git branch'
alias gd='git diff'
alias ggpull='git pull origin "$(git rev-parse --abbrev-ref HEAD)"'
alias ggpush='git push origin "$(git rev-parse --abbrev-ref HEAD)"'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

### --- PATH ---
export PATH="$HOME/.local/bin:$PATH"

### --- Tools ---
export GIT_PAGER=less

if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi
export FZF_DEFAULT_OPTS="--extended"

if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

### --- Source Local Overrides ---
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f "$HOME/.extras" ] && source "$HOME/.extras"
