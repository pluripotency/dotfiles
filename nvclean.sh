#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
NVCONF_DIR=${HOME}/.config/nvim

echo "Unlinking ${NVCONF_DIR}"
unlink ${NVCONF_DIR}

case ${1} in
  "all" ) 
    NVCASH_DIR=${HOME}/.cache/nvim
    rm -rf ${NVCASH_DIR}
    NVLOCAL_DIR=${HOME}/.local/nvim
    rm -rf ${NVLOCAL_DIR}
    ;;
esac
