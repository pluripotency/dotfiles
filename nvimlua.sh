#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
NVCONF_DIR=${HOME}/.config/nvim

case ${1} in
  "clean" ) 
		echo "Remove ${NVCONF_DIR}"
  	rm -rf ${NVCONF_DIR}
		exit
		;;
esac

echo "Create ${NVCONF_DIR}"
mkdir -p ${NVCONF_DIR}
for ITEM in init.lua lua
do
	ln -snf ${CURRENT}/config/nvim/${ITEM} ${NVCONF_DIR}/${ITEM}
done

