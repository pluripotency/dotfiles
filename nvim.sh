#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
CONF_DIR=${HOME}/.config
if [ ! -d ${CONF_DIR} ];then
  mkdir -p ${CONF_DIR}
fi
NVCONF_DIR=${CONF_DIR}/nvim
${CURRENT}/nvclean.sh

case ${1} in
  "clean" ) 
    ${CURRENT}/nvbashrc.sh clean
    exit
    ;;
esac

case ${2} in
  "nvks" ) 
    SRCDIR=nvks
    ;;
  *)
    SRCDIR=nvim
    ;;
esac

echo "Linking ${SRCDIR} to ${NVCONF_DIR}"
ln -s ${CURRENT}/${SRCDIR} ${NVCONF_DIR}

${CURRENT}/nvbashrc.sh
