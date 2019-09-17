#!/bin/bash

# dependencies
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt -y install zsh
    sudo apt -y install vim-nox
    sudo apt -y install httpie
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install zsh
    brew install httpie
fi

git clone git@github.com:MeilleursAgents/MeilleursAgents.git ~/ma1
git clone git@github.com:MeilleursAgents/MeilleursAgents.git ~/ma2
git clone git@github.com:MeilleursAgents/MA-Infra.git ~/MA-Infra

cd ~/dotfiles/ && git submodule update --init

# pyenv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(PYENV_ROOT)/plugins/pyenv-virtualenv

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/bin ~/bin
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/omz_custom ~/.omz_custom
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/pythonrc.py ~/.pythonrc.py
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmuxp ~/.tmuxp
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/psqlrc ~/.psqlrc
ln -s ~/dotfiles/sbclrc ~/.sbclrc
ln -s ~/dotfiles/localrc ~/.localrc
ln -s ~/dotfiles/vagrant-provisioning.sh ~/.vagrant-provisioning.sh
ln -s ~/dotfiles/antigenrc ~/.antigenrc

sudo chsh -s `which zsh` jonathanc

~/dotfiles/fzf/install

pip install --user powerline-status
pip install --user tmuxp
pip install --user gitpython

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install httpie
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
    sudo dpkg -i ripgrep_11.0.2_amd64.deb
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install httpie
    brew install ripgrep
fi

NODE_VERSION="10"

rm -rf "${HOME}/n-install"
git clone --depth 1 https://github.com/tj/n.git "${HOME}/n-install"
pushd "${HOME}/n-install"
PREFIX="${HOME}/opt" make install
popd
rm -rf "${HOME}/n-install"

n "${NODE_VERSION}"

npm install --ignore-scripts -g npm node-gyp
