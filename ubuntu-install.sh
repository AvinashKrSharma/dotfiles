#list of packages to be installed
packages="curl git vim nodejs jshint tslint csslint lessc node-sass"

#for nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

#clone dotfiles in home directory
git clone https://github.com/AvinashKrSharma/dotfiles.git ~

sudo apt-get install -y $packages

#make required directories
mkdir $HOME/.vim/tmp

#create symlinks
ln -s dotfiles/aliases ~/.aliases
ln -s dotfiles/bash-profile ~/.bash_profile
ln -s dotfiles/emacs ~/.emacs
ln -s dotfiles/tmux-conf ~/.tmux.conf
ln -s dotfiles/vimrc ~/.vimrc
ln -s dotfiles/zshrc ~/.zshrc
ln -s ~/.vim ~/.config/nvim
ln -s dotfiles/vimrc ~/.config/nvim/init.vim
