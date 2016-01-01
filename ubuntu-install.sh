#list of packages to be installed
packages="curl git vim nodejs tidy zsh tmux build-essentials cmake python-dev default-jdk"

npm_modules="jshint js-beautify tslint node-sass less typescript-formatter csslint instant-markdown-d"

#for nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

#clone dotfiles in home directory
git clone https://github.com/AvinashKrSharma/dotfiles.git ~

#install apt-get packages
sudo apt-get install -y $packages

#install npm modules
sudo npm install -g $npm_modules

#make required directories
mkdir $HOME/.vim/tmp

#install the awesome oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#make zsh default shell
chsh -s $(which zsh)

#backup default .zshrc file created by oh-my-zsh
cp ~/.zshrc.backup ~/.zshrc

#create symlinks
ln -s dotfiles/aliases ~/.aliases
ln -s dotfiles/bash-profile ~/.bash_profile
ln -s dotfiles/emacs ~/.emacs
ln -s dotfiles/tmux-conf ~/.tmux.conf
ln -s dotfiles/vimrc ~/.vimrc
ln -s dotfiles/zshrc ~/.zshrc
ln -s ~/.vim ~/.config/nvim
ln -s dotfiles/vimrc ~/.config/nvim/init.vim
