#!/bin/bash

# install require package and library
sudo apt-get update
sudo apt-get upgrade -y 
sudo apt-get install git curl -y
sudo apt-get install build-essential cmake python-dev python-fontforge -y
sudo apt-get install silversearcher-ag libncurses5-dev fontconfig -y

# install gnu global for trace code
wget http://tamacom.com/global/global-6.6.2.tar.gz
tar zxvf global-6.6.2.tar.gz
cd global-6.6.2
./configure && make 
sudo make install

# setup vim plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
git clone https://github.com/genesisgardian/vimrc.git ~/vimrc
cd ~/vimrc
cp .vimrc ~/.vimrc
vim +PluginInstall +qall
cd ~/.vim/bundle/vimproc.vim/ 
make

# setup font
cd ~/vimrc
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf
~/.vim/bundle/vim-powerline/fontpatcher/fontpatcher Ubuntu\ Mono\ derivative\ Powerline.ttf
mkdir ~/.fonts
cp ./Ubuntu\ Mono\ derivative\ Powerline.ttf ~/.fonts/
sudo fc-cache -vf
vim +PowerlineClearCache +qall
cd
rm -rf vimrc
rm -rf global-6.6.2*

