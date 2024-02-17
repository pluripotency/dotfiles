#! /bin/sh 
CURRENT=$(cd $(dirname $0);pwd)
CONF_DIR=${HOME}/.config
if [ ! -d ${CONF_DIR} ];then
  mkdir -p ${CONF_DIR}
fi

declare -a NVLIST=("nmin" "nvks" "lvim")
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
  echo "Linking ${SRC} to ${DST}"
  cd ${CONF_DIR}
  ln -s ${SRC} ${NV}
  sh ${CURRENT}/nvbashrc.sh ${NV}
done

