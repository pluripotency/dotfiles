#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
NVCONF_DIR=${HOME}/.config/nvim

echo "Unlinking ${NVCONF_DIR}"
unlink ${NVCONF_DIR}
