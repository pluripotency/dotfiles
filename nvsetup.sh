#! /bin/bash 
CURRENT=$(cd $(dirname $0);pwd)
CONF_DIR=${HOME}/.config
if [ ! -d ${CONF_DIR} ];then
  mkdir -p ${CONF_DIR}
fi

BASHRC=$HOME/.bashrc
declare -a NVLIST=("nmin" "nvks" "nks" "nksb")
declare -a CONFLIST=("pylintrc")

case ${1} in
  "clean" ) 
    sh ${CURRENT}/nvbashrc.sh clean
    for NV in "${NVLIST[@]}"
    do
      TGT=$HOME/.config/$NV
      if [ -L $TGT ]; then
        echo "Uninking ${TGT}"
        unlink ${TGT}

        TGT=${HOME}/.cache/${NV}
        echo "Deleting ${TGT}"
        rm -rf ${TGT}
        TGT=${HOME}/.local/share/${NV}
        echo "Deleting ${TGT}"
        rm -rf ${TGT}
        TGT=${HOME}/.local/state/${NV}
        echo "Deleting ${TGT}"
        rm -rf ${TGT}
        echo "Deleting ${NV} entry in bashrc..."
        sed -i "/alias ${NV}=/d" ${BASHRC}
      fi
    done
    for CF in "${CONFLIST[@]}"
    do
      TGT=$HOME/.config/$CF
      if [ -L $TGT ]; then
        echo "Uninking ${TGT}"
        unlink ${TGT}
      fi
    done
    exit
    ;;
esac

for NV in "${NVLIST[@]}"
do
  if [ ! -z ${NV} ]; then
    SRC=${CURRENT}/${NV}
    if [ -d ${SRC} ]; then
      DST=${CONF_DIR}/${NV}
      if [ ! -L ${DST} ] && [ ! -e ${DST} ]; then
        echo "Linking ${SRC} to ${DST}"
        ln -s ${SRC} ${DST}
        echo "Adding ${NV} entry to .bashrc..."
        LINK="alias ${NV}='NVIM_APPNAME=${NV} nvim'"
        grep -q "${LINK}" ${BASHRC} || echo "${LINK}" >> ${BASHRC} 
        exit
      fi
    fi
  fi
done
for CF in "${CONFLIST[@]}"
do
  if [ ! -z ${CF} ]; then
    SRC=${CURRENT}/${CF}
    if [ -f ${SRC} ]; then
      DST=${CONF_DIR}/${CF}
      if [ ! -L ${DST} ] && [ ! -e ${DST} ]; then
        echo "Linking ${SRC} to ${DST}"
        ln -s ${SRC} ${DST}
      fi
    fi
  fi
done
