# Environment Setup

Using ``wget`` command

```
$ wget -qO- https://raw.githubusercontent.com/biciguia/environment.castle/master/bootstrap.sh | bash
~/.homesick/repos/environment.castle/bootstrap.sh all
```

Other possible options for bootstrap.sh:


* tools

	Installs all the tools we use for development.

* link

	Creates the symbolic links in the home directory

* pull

	Updates the environment repository

* sublime

	Installs Sublime Text 2.0.2 into ~/labxp/Sublime Text 2/ and makes a symbolic link in ~/bin/

* gitprompt

	Installs the [official bash completion and git prompt](https://github.com/git/git/tree/master/contrib/completion) from the official git repository

* gitflow

	Installs the [gitflow plugin for git](https://github.com/nvie/gitflow)

* node

	Installs node.js, grunt and gh utilities. We compiled node [ourselves](https://github.com/biciguia/node) for convenience.

# Other utilities

* start-server.sh

	Runs a simple http server for the local directory with python.

* run-tests.sh

	Runs tests on the CLI using a local install of node in ~/local

# Customize your personal data

Edit ~/.gitconfig or this repository's home/.gitconfig file to make sure it includes your info.

