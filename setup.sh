#!/bin/bash

ORANGE='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release) == '"Ubuntu"' ]]; then
        echo "Ubuntu detected"
        apt-get update && \
        apt-get install -y git && \
        apt-get install -y zsh tmux vim htop
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

git clone https://github.com/OrangeOnBlack/dotfiles
cp dotfiles/.* ~/ 2>/dev/null # suppress 'cp: dotfiles/.git is a directory (not copied).'
rm -rf dotfiles

# add public ssh key
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release) == '"Ubuntu"' ]]; then
        mkdir ~/.ssh
        touch ~/.ssh/authorized_keys
        curl https://github.com/OrangeOnBlack.keys >> ~/.ssh/authorized_keys
    fi
fi

printf "${ORANGE}To switch to Zsh run${NC}\n"
printf "${ORANGE}chsh -s $(which zsh)${NC}"
