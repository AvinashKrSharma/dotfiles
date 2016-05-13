#list of packages to be installed
packages="git curl tidy zsh tmux cmake python-dev default-jdk editorconfig silversearcher-ag checkinstall"

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

#backup default .zshrc file created by oh-my-zsh
mv  ~/.zshrc ~/.zshrc.backup

#build vim from source
apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev
apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common
git clone https://github.com/vim/vim.git ~
./vim/configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config --enable-perlinterp
            --enable-luainterp \ --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
(cd vim && make install && checkinstall)
#phew!!

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
ln -s dotfiles/addons ~/.vimrc
ln -s dotfiles/zshrc ~/.zshrc
ln -s ~/.vim ~/.config/nvim
ln -s dotfiles/vimrc ~/.config/nvim/init.vim

echo "NOTE: zsh as default shell will be reflected after the next login"

#make zsh default shell
chsh -s $(which zsh)
