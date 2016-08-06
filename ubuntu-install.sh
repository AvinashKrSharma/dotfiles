#list of packages to be installed
packages="git curl vim tidy zsh tmux cmake xclip default-jdk editorconfig silversearcher-ag checkinstall"

for_neovim="software-properties-common python-dev python-pip python3-dev python3-pip neovim"

npm_modules="js-beautify node-sass less csslint eslint"

#required beforehand(to be figured out why)
apt-get install -y build-essentials

#adding PPA for neovim
add-apt-repository ppa:neovim-ppa/unstable

#update before doing anything
apt-get update

#install apt-get packages
apt-get install -y $packages $for_neovim

#installing/upgrading neovim(required for deoplete)
pip3 install neovim
pip3 install --upgrade neovim

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

#create symlinks
ln -s dotfiles/aliases ~/.aliases
ln -s dotfiles/emacs ~/.emacs
ln -s dotfiles/tmux-conf ~/.tmux.conf
ln -s dotfiles/vimrc ~/.vimrc
ln -s dotfiles/zshrc ~/.zshrc
ln -s ~/.vim ~/.config/nvim
ln -s ~/dotfiles/vimrc ~/.vim/init.vim

echo "NOTE: zsh as default shell will be reflected after the next login"

#make zsh default shell
chsh -s $(which zsh)
