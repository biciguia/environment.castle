#!/bin/bash

cd ~/labxp/biciguia-frontend

if [[ ! -e node_modules ]]; then
    ln -s ../../local/lib/node_modules node_modules
fi

grunt test --verbose

cd -
