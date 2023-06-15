#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
NVCONF_DIR=${HOME}/.config/nvim

echo "Removing ${NVCONF_DIR}"
rm -rf ${NVCONF_DIR}
