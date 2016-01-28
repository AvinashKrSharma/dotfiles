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

# source in the oh-my-zsh awesomeness
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# source in the aliases
source $HOME/.aliases

#source keybindings
source $HOME/dotfiles/keybindings

# This loads nvm
export NVM_DIR="/home/avinash/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

# Open tmux session
tmux -2uq attach &> /dev/null

# Otherwise start new tmux session
if [[ ! $TERM =~ screen  ]]; then
    exec tmux -2uq
fi

# source the system specific extras file
source $HOME/.extras
