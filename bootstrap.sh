#!/bin/sh

# Install Git
#sudo apt-get install git

# Homesick
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh
LINKER=homeshick

# Dotfiles
$LINKER -b clone https://github.com/biciguia/environment.castle.git

# Linking
if [[ $1 == "link" || $1 == "pull" ]] ; then
    $LINKER $1 environment.castle
fi

