# Install Plugin
vim +PluginInstall +qall
# YCM
if [ -d $HOME/.vim/bundle/YouCompleteMe ]; then
  cd $HOME/.vim/bundle/YouCompleteMe
  ./install.py --clang-completer
fi
