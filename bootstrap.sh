#!/bin/bash

# Install Git
#sudo apt-get install git

# Gitflow
if [[ $1 == "gitflow" ]] ; then
    mkdir ~/bin
    wget -c https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
    chmod +x gitflow-installer.sh
    INSTALL_PREFIX=~/bin ./gitflow-installer.sh
    rm gitflow-installer.sh
fi

# Gems
gem install vagrant

# Homesick
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh
LINKER=homeshick

# Dotfiles
$LINKER -b clone https://github.com/biciguia/environment.castle.git

# Linking
if [[ $1 == "link" || $1 == "pull" ]] ; then
    $LINKER $1 environment.castle
fi
