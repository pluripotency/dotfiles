#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
CONF_DIR=${HOME}/.config
NVCONF_DIR=${CONF_DIR}/nvim
${CURRENT}/nvclean.sh

case ${1} in
  "clean" ) exit;;
esac

echo "Create ${NVCONF_DIR}"
cp -rf ${CURRENT}/nvim ${CONF_DIR}
