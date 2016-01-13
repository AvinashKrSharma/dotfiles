#list of packages to be installed
packages="curl git vim tidy zsh tmux cmake python-dev default-jdk editorconfig silversearcher-ag"

npm_modules="jshint js-beautify tslint node-sass less typescript-formatter csslint"

#required beforehand(to be figured out why)
sudo apt-get install -y build-essentials

#upgrade before doing anything
#sudo apt-get update

#install apt-get packages
sudo apt-get install -y $packages

#for nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

#clone dotfiles in home directory
git clone https://github.com/AvinashKrSharma/dotfiles.git ~

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

echo "NOTE: zsh as default shell will be reflected after the next login"
