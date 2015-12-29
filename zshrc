 export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

DEFAULT_USER="avinash"

# source in the oh-my-zsh awesomeness
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# source in the aliases
source $HOME/.aliases

# reverse esc and caps lock keys
xmodmap -e "clear Lock"
xmodmap -e "keycode 9 = Caps_Lock"
xmodmap -e "keycode 66 = Escape"
xmodmap -e "add Lock = Caps_Lock"
