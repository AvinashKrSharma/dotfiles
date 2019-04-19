export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM="$HOME/dotfiles/"

ZSH_THEME="bd"

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(command-not-found common-aliases docker extract git node npm pip python sudo)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

DEFAULT_USER="avinash"

# source in the oh-my-zsh awesomeness
source $ZSH/oh-my-zsh.sh

#antigen
source $(brew --prefix)/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

#include z
. $HOME/z/z.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# source in the aliases
source $HOME/.aliases

# source the ultimate fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# source the system specific extras file
source $HOME/.extras
