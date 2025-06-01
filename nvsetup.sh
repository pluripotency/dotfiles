#! /bin/bash 
CURRENT=$(cd $(dirname $0);pwd)
CONF_DIR=${HOME}/.config
if [ ! -d ${CONF_DIR} ];then
  mkdir -p ${CONF_DIR}
fi

BASHRC=$HOME/.bashrc
declare -a NVLIST=("nmin" "nks" "nvim" "lvim" "nold" "nvks")
declare -a CONFLIST=("pylintrc")

case ${1} in
  "clean" ) 
    for NV in "${NVLIST[@]}"
    do
      TGT=$HOME/.config/$NV
      if [ -L $TGT ]; then
        echo "Uninking ${TGT}"
        unlink ${TGT}

        TGT1=${HOME}/.cache/${NV}
        TGT2=${HOME}/.local/share/${NV}
        TGT3=${HOME}/.local/state/${NV}
        echo "Deleting ${TGT1} ${TGT2} ${TGT3}"
        rm -rf ${TGT1} ${TGT2} ${TGT3}

        if [ ${NV} != "nvim" ]; then
          echo "Deleting ${NV} entry in bashrc..."
          sed -i "/alias ${NV}='NVIM_APPNAME/d" ${BASHRC}
        fi
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
  *) 
    if [ ! -z ${1} ]; then
      echo "No such arg: [blank] or clean"
      exit
    fi
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

        if [ ${NV} != "nvim" ]; then
          echo "Adding ${NV} entry to .bashrc..."
          LINK="alias ${NV}='NVIM_APPNAME=${NV} nvim'"
          grep -q "${LINK}" ${BASHRC} || echo "${LINK}" >> ${BASHRC}
        # else
        #   NVIMAPP="alias nvim='/usr/local/bin/nvim.appimage'"
        #   grep -q "${NVIMAPP}" ${BASHRC} || echo "${NVIMAPP}" >> ${BASHRC}
        fi
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
