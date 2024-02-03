#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
BASHRC=$HOME/.bashrc
NVIM_LINK="alias nvim='/usr/local/bin/nvim.appimage'"
VIM_LINK="alias vim='/usr/local/bin/nvim.appimage'"

case ${1} in
  "clean" ) 
    echo "Deleting .bashrc entry for nvim..."
    sed -i "/alias nvim=/d" ${BASHRC}
    sed -i "/alias vim=/d" ${BASHRC}
    exit
    ;;
esac

echo "Setting .bashrc entry for nvim..."
# add alias
grep -q "${NVIM_LINK}" ${BASHRC} || echo "${NVIM_LINK}" >> ${BASHRC} 
grep -q "${VIM_LINK}" ${BASHRC} || echo "# ${VIM_LINK}" >> ${BASHRC} 

