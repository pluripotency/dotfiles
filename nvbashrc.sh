#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
BASHRC=$HOME/.bashrc
NVIM_LINK="alias nvim='/usr/local/bin/nvim.appimage'"
VIM_LINK="alias vim='nvim'"

case ${1} in
  "clean" ) 
    for i in nvim vim nvks nmin lvim
    do
      echo "Deleting ${i} entry in bashrc..."
      sed -i "/alias ${i}=/d" ${BASHRC}
    done
    exit
    ;;
  * )
    if [ -d ${CURRENT}/${1} ]; then
      echo "Adding ${1} entry to .bashrc..."
      LINK="alias ${1}='NVIM_APPNAME=${1} nvim'"
      grep -q "${LINK}" ${BASHRC} || echo "${LINK}" >> ${BASHRC} 
      exit
    fi
    ;;
esac

echo "Adding nvim/vim entry to .bashrc..."
grep -q "${NVIM_LINK}" ${BASHRC} || echo "${NVIM_LINK}" >> ${BASHRC} 
grep -q "${VIM_LINK}" ${BASHRC} || echo "# ${VIM_LINK}" >> ${BASHRC} 

