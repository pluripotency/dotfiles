#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
NVCONF_DIR=${HOME}/.config/nvim
${CURRENT}/nvclean.sh

case ${1} in
  "clean" ) exit;;
esac

echo "Create ${NVCONF_DIR}"
#git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim --depth 1
ln -s ${CURRENT}/nvks ${NVCONF_DIR}
