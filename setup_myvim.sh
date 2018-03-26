#!/bin/bash

MYVIM="myvim"
OS=`uname -s`

if [ "$OS" != "Darwin" ] && [ "$OS" != "Linux" ]; then
    echo "error: unsupported OS $OS"
    exit 1
fi

cd $HOME
echo ""
echo -e "Install dependent software packages ...\n"
if [ "$OS" = "Darwin" ]; then
    if [ "`which brew`" = "" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    if [ "`which git`" = "" ];then
        brew install git > /dev/null
        brew install macvim > /dev/null
    fi
else #Some Linux version
    if [ "`which apt-get`" != "" ]; then
        sudo apt-get update > /dev/null
        sudo apt-get -y install vim-gnome > /dev/null
        sudo apt-get -y install git cscope ctags > /dev/null
    elif [ "`which yum`" != "" ]; then
        sudo yum -y install vim-gnome > /dev/null
        sudo yum -y install git cscope ctags > /dev/null
    elif [ "`which pacman`" != "" ]; then
        sudo pacman -Sy
        sudo pacman -S --needed vim-gnome > /dev/null
        sudo pacman -S --needed git cscope ctags > /dev/null
    else
        echo "error: unknown package manerger"
        exit 1
    fi
fi
if [ -d $HOME/$MYVIM ]; then
    rm -rf $HOME/$MYVIM
fi
VIM_URL="https://github.com/zhanwwan/myvim.git"
git clone -q ${VIM_URL}
cp -rf $HOME/$MYVIM/vimrc $HOME/.vimrc
tar xzvf $HOME/$MYVIM/vim.tar.gz -C $HOME > /dev/null

echo "Setup finieshed!"
