#! /bin/bash 
CURRENT=$(cd $(dirname $0);pwd)
DOT_DIR=${HOME}
declare -a DOTLIST=("vimrc" "tmux.conf")

case ${1} in
  "clean" ) 
    for DOT in "${DOTLIST[@]}"
    do
      TGT=$HOME/.$DOT
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

for DOT in "${DOTLIST[@]}"
do
  if [ ! -z ${DOT} ]; then
    SRC=${CURRENT}/${DOT}
    if [ -f ${SRC} ]; then
      DST=${DOT_DIR}/.${DOT}
      if [ ! -L ${DST} ] && [ ! -e ${DST} ]; then
        echo "Linking ${SRC} to ${DST}"
        ln -s ${SRC} ${DST}
      fi
    fi
  fi
done
