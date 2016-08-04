#list of packages to be installed
packages="git curl vim tidy zsh tmux cmake python-dev default-jdk editorconfig silversearcher-ag checkinstall"

npm_modules="jshint js-beautify tslint node-sass less typescript-formatter csslint eslint babel-eslint eslint-plugin-react"

#required beforehand(to be figured out why)
apt-get install -y build-essentials

#update before doing anything
apt-get update

#install apt-get packages
apt-get install -y $packages

#for nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

#install npm modules
npm install -g $npm_modules

#make required directories
mkdir $HOME/.vim/tmp

#install the awesome oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# clone z
git clone https://github.com/rupa/z.git ~

#backup default .zshrc file created by oh-my-zsh
mv  ~/.zshrc ~/.zshrc.backup

#antigen for zsh
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh

#installing neovim
sudo apt-get install software-properties-common python-dev python-pip python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
pip2 install --upgrade neovim
pip3 install --upgrade neovim


#setting vim as default editor
update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
update-alternatives --set editor /usr/bin/vim
update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
update-alternatives --set vi /usr/bin/vim

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

#make zsh default shell
chsh -s $(which zsh)
