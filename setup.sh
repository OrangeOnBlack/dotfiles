#!/bin/bash

ORANGE='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release) == '"Ubuntu"' ]]; then
        printf "${ORANGE}Ubuntu detected${NC}\n"
        apt-get update && \
        apt-get install -y git && \
        apt-get install -y zsh tmux vim htop
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
        printf "${ORANGE}MacOS detected${NC}\n"
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

# set shell for tmux by adding to .tmux.conf
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release) == '"Ubuntu"' ]]; then
        sed -i '1s/^/set-option -g default-shell \/usr\/bin\/zsh \n\n/' $HOME/.tmux.conf
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '1s/^/set-option -g default-shell \/usr\/local\/bin\/zsh \n\n/' $HOME/.tmux.conf
fi

printf "${ORANGE}To switch to Zsh run${NC}\n"
printf "${ORANGE}chsh -s $(which zsh)${NC}\n"
