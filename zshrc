 export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(bower command-not-found coffee common-aliases dircycle docker encode64 git meteor node npm pip python sudo tmux web-search)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

DEFAULT_USER="avinash"

ZSH_TMUX_AUTOSTART=true

# source in the oh-my-zsh awesomeness
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# source in the aliases
source $HOME/.aliases

#source keybindings
source $HOME/dotfiles/keybindings

export NVM_DIR="/home/avinash/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=${PATH}:/home/avinash/arcanist/bin/

source ~/arcanist/resources/shell/bash-completion
