#!/bin/bash

my_install () {
    local sys=$1; shift
    for item in $@; do
        if [[ "$sys" == "debian" ]]; then
            sudo apt -y install $item
        elif [[ "$sys" == "osx" ]]; then
            brew install $item
        elif [[ "$sys" == "arch" ]]; then
            sudo pacman -S $item
        fi
    done
}

my_install $1 zsh vim-nox httpie

[[ ! -d "${HOME}/ma1" ]] && git clone git@github.com:MeilleursAgents/MeilleursAgents.git ~/ma1
[[ ! -d "${HOME}/ma2" ]] && git clone git@github.com:MeilleursAgents/MeilleursAgents.git ~/ma2
[[ ! -d "${HOME}/MA-Infra" ]] && git clone git@github.com:MeilleursAgents/MA-Infra.git ~/MA-Infra

cd ~/dotfiles/ && git submodule update --init

# pyenv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
PYENV_ROOT=${HOME}/.pyenv
[[ ! -d "${PYENV_ROOT}/plugins/pyenv-virtualenv" ]] && git clone https://github.com/pyenv/pyenv-virtualenv.git $(PYENV_ROOT)/plugins/pyenv-virtualenv

[[ ! -d "${HOME}/.tmux/plugins/tpm" ]] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

[[ ! -L "${HOME}/.antigenrc" ]] && ln -s ~/dotfiles/antigenrc ~/.antigenrc
[[ ! -L "${HOME}/bin" ]] && ln -s ~/dotfiles/bin ~/bin
[[ ! -L "${HOME}/.gitconfig" ]] && ln -s ~/dotfiles/gitconfig ~/.gitconfig
[[ ! -L "${HOME}/.localrc" ]] && ln -s ~/dotfiles/localrc ~/.localrc
[[ ! -L "${HOME}/.oh-my-zsh" ]] && ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
[[ ! -L "${HOME}/.omz_custom" ]] && ln -s ~/dotfiles/omz_custom ~/.omz_custom
[[ ! -L "${HOME}/.psqlrc" ]] && ln -s ~/dotfiles/psqlrc ~/.psqlrc
[[ ! -L "${HOME}/.pythonrc.py" ]] && ln -s ~/dotfiles/pythonrc.py ~/.pythonrc.py
[[ ! -L "${HOME}/.sbclrc" ]] && ln -s ~/dotfiles/sbclrc ~/.sbclrc
[[ ! -L "${HOME}/.tmux.conf" ]] && ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
[[ ! -L "${HOME}/.tmuxp" ]] && ln -s ~/dotfiles/tmuxp ~/.tmuxp
[[ ! -L "${HOME}/.vim" ]] && ln -s ~/dotfiles/vim ~/.vim
[[ ! -L "${HOME}/.vimrc" ]] && ln -s ~/dotfiles/vimrc ~/.vimrc
[[ ! -L "${HOME}/.zshrc" ]] && ln -s ~/dotfiles/zshrc ~/.zshrc

sudo chsh -s $(which zsh) jonathanc

~/dotfiles/fzf/install

pip install --user powerline-status
pip install --user tmuxp
pip install --user gitpython

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
rm ripgrep_11.0.2_amd64.deb

NODE_VERSION="12"

rm -rf "${HOME}/n-install"
git clone --depth 1 https://github.com/tj/n.git "${HOME}/n-install"
pushd "${HOME}/n-install"
PREFIX="${HOME}/opt" make install
popd
rm -rf "${HOME}/n-install"

n "${NODE_VERSION}"

npm install --ignore-scripts -g npm node-gyp
