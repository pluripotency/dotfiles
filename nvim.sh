#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
CONF_DIR=${HOME}/.config
if [ ! -d ${CONF_DIR} ];then
  mkdir -p ${CONF_DIR}
fi
NVCONF_DIR=${CONF_DIR}/nvim
${CURRENT}/nvclean.sh

case ${1} in
  "clean" ) exit;;
esac

echo "Linking ${NVCONF_DIR}"
ln -s ${CURRENT}/nvim ${CONF_DIR}

# alias
BASHRC=$HOME/.bashrc
NVIM_LINK="alias nvim='/usr/local/bin/nvim.appimage'"
VIM_LINK="alias vim='/usr/local/bin/nvim.appimage'"
grep -q "${NVIM_LINK}" ${BASHRC} || echo "${NVIM_LINK}" >> ${BASHRC} 
grep -q "${VIM_LINK}" ${BASHRC} || echo "# ${VIM_LINK}" >> ${BASHRC} 

