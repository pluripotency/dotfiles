#! /bin/sh 
CURRENT=$(cd $(dirname $0);pwd)

NV=${1}

TGT=${HOME}/.config/${NV}
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

