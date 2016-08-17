#!/bin/bash
# Install Plugin
vim +PluginInstall +qall
# YCM
cd $HOME/.vim/bundle/YouCompleteMe
./install.py --clang-completer
