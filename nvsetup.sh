#! /bin/sh 
CURRENT=$(cd $(dirname $0);pwd)
CONF_DIR=${HOME}/.config
if [ ! -d ${CONF_DIR} ];then
  mkdir -p ${CONF_DIR}
fi

declare -a NVLIST=("nmin" "nvks" "nks" "nksb")
case ${1} in
  "clean" ) 
    sh ${CURRENT}/nvbashrc.sh clean
    for NV in "${NVLIST[@]}"
    do
      sh ${CURRENT}/nvclean.sh ${NV}
    done
    exit
    ;;
esac
sh ${CURRENT}/nvbashrc.sh

for NV in "${NVLIST[@]}"
do
  SRC=${CURRENT}/${NV}
  if [ -d ${SRC} ]; then
    DST=${CONF_DIR}/${NV}
    if [ ! -L ${DST} ] && [ ! -e ${DST} ]; then
      echo "Linking ${SRC} to ${DST}"
      ln -s ${SRC} ${DST}
      sh ${CURRENT}/nvbashrc.sh ${NV}
    fi
  fi
done

declare -a CONFLIST=("pylintrc")
for CF in "${CONFLIST[@]}"
do
  SRC=${CURRENT}/${CF}
  if [ -f ${SRC} ]; then
    DST=${CONF_DIR}/${CF}
    if [ ! -L ${DST} ] && [ ! -e ${DST} ]; then
      echo "Linking ${SRC} to ${DST}"
      ln -s ${SRC} ${DST}
    fi
  fi
done
