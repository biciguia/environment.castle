#!/bin/bash

cd ~/labxp/biciguia-frontend
echo "Rodando servidor (Ctrl-C para parar)..."
echo "Se o servidor parar automaticamente, algo está usando a porta 8000"
python -m SimpleHTTPServer 8000 2>/dev/null
cd -
