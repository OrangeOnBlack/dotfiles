#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release) == '"Ubuntu"' ]]; then
        echo "Ubuntu detected"
        sudo apt-get update && sudo apt-get install -y zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "MacOS detected"
        brew install zsh
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        brew tap sambadevi/powerlevel9k
        brew install powerlevel9k
fi
chsh -s $(which zsh)

git clone https://github.com/OrangeOnBlack/dotfiles
cp dotfiles/.* ~/ 2>/dev/null # suppress 'cp: dotfiles/.git is a directory (not copied).'
rm -rf dotfiles

# add public ssh key
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release) == '"Ubuntu"' ]]; then
        curl https://github.com/OrangeOnBlack.keys >> ~/.ssh/authorized_keys
    fi
fi
