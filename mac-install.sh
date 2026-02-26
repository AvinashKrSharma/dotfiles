# install homebrew
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git
# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

# add nvm path to zshrc as given in the installation logs
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

souce ~/.zshrc
# type nvm and see if the command works
# nvm install 6.11.0
# nvm alias default 6.11.0
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install neovim
brew install antigen
# generate ssh keys : open terminal and
ssh-keygen -t rsa -b 4096 -C
follow github ssh key addition instruction from gihub
brew install the_silver_searcher editorconfig
npm install -g js-beautify csslint eslint
brew install python3
pip3 install --upgrade neovim
pip3 install neovim
mkdir $HOME/.vim
mkdir $HOME/.vim/tmp
git clone
https://github.com/rupa/z.git
~
mv ~/.zshrc ~/.zshrc.backup
curl -L
https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh
~/antigen.zsh
for fonts go to vim-devicons & install manually


ln -s dotfiles/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s dotfiles/vscode-keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json