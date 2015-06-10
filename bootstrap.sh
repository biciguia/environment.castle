#!/bin/bash

# setup homeshick
if [[ ! -e $HOME/.homesick/repos/homeshick ]]; then
    # Homesick
    git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
else
    cd $HOME/.homesick/repos/homeshick
    git pull
    cd -
fi

source $HOME/.homesick/repos/homeshick/homeshick.sh
LINKER=homeshick

if [[ ! -e ~/labxp/biciguia-frontend ]]; then
    echo "Creating directories in ~/labxp ..."
    # Folders
    mkdir ~/labxp
    cd ~/labxp
    git clone https://github.com/biciguia/biciguia-frontend.git
    cd -
    cd ~/labxp/biciguia-frontend
    git submodule init
    git submodule update
    cd -
fi

# Dotfiles
$LINKER -b clone https://github.com/biciguia/environment.castle.git

# Linking
if [[ $1 == "link" || $1 == "pull" ]] ; then
    $LINKER $1 environment.castle
fi

# installing all tools
if [[ $1 == "tools" ]] ; then
    bash $0 sublime
    bash $0 gitprompt
    bash $0 gitflow
    bash $0 node
fi

if [[ $1 == "node" ]]; then
    if [[ ! -e node ]]; then
        git clone https://github.com/biciguia/node.git node
    else
        cd node
        git pull
        cd -
    fi

    if [[ ! -e ~/local ]]; then
        echo "Installing node into ~/local"
        # Make symbolic link for node
        ln -s $HOME/.homesick/repos/environment.castle/node $HOME/local
    else
        echo "Error! ~/local already exists!"
    fi
fi

if [[ $1 == "gitflow" ]]; then
    echo "Installing gitflow from https://github.com/nvie/gitflow into ~/bin"
    # Gitflow
    mkdir ~/bin
    wget -c https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
    chmod +x gitflow-installer.sh
    INSTALL_PREFIX=~/bin ./gitflow-installer.sh
    rm gitflow-installer.sh
fi

if [[ $1 == "gitprompt" ]]; then
    echo "Installing git-prompt and git-completion from the main git repository into ~/bin"
    # Git-prompt
    wget -O $HOME/bin/.git-prompt.sh -c https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
    # Git-completion
    wget -O $HOME/bin/.git-completion.bash -c https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

if [[ $1 == "sublime" ]]; then
    echo "Installing sublime text 2.0.2 into ~/labxp/Sublime Text 2/"
    # Sublime
    wget -O $HOME/labxp/subl.tar.bz2 -c http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2
    tar xvf $HOME/labxp/subl.tar.bz2 -C $HOME/labxp
    ln -s $HOME/labxp/Sublime\ Text\ 2/sublime_text ~/bin/subl
    rm $HOME/labxp/subl.tar.bz2
fi

