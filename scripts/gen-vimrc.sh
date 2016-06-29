VIM_HOME=${HOME}/.vim
VIMRC_DIR=${VIM_HOME}/vimrc/
cd ${VIM_HOME}/scripts

if [ -f "${VIM_HOME}/.vimrc" ]
then
  rm ${VIM_HOME}/.vimrc
fi


for i in `ls ${VIMRC_DIR}`
do
  echo "source ${VIMRC_DIR}${i}" >> ${VIM_HOME}/.vimrc
done


ln -si ${VIM_HOME}/.vimrc ${HOME}/.vimrc
