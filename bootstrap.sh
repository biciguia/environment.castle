#!/bin/bash

# Install Git
#sudo apt-get install git

if [[ $1 == "tools" ]] ; then
    # Gitflow
    mkdir ~/bin
    wget -c https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
    chmod +x gitflow-installer.sh
    INSTALL_PREFIX=~/bin ./gitflow-installer.sh
    rm gitflow-installer.sh
    # Git-prompt
    wget -O $HOME/bin/.git-prompt.sh -c https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
    # Git-completion
    wget -O $HOME/bin/.git-completion.bash -c https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
    # Sublime
    wget -O $HOME/labxp/subl.tar.bz2 -c http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2
    tar xvf $HOME/labxp/subl.tar.bz2 -C $HOME/labxp
    ln -s $HOME/labxp/Sublime\ Text\ 2/sublime_text ~/bin/subl
    rm $HOME/labxp/subl.tar.bz2
    # Folders
    mkdir ~/labxp
    cd ~/labxp
    git clone https://github.com/biciguia/biciguia-frontend.git
    # Gems
    gem install --user vagrant
fi

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
