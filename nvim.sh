#! /bin/sh
CURRENT=$(cd $(dirname $0);pwd)
NVCONF_DIR=${HOME}/.config/nvim

ARGS=menu
case ${1} in
  "clean" ) 
		echo "Remove ${NVCONF_DIR}"
  	rm -rf ${NVCONF_DIR}
		exit
		;;
esac

echo "Create ${NVCONF_DIR}"
mkdir -p ${NVCONF_DIR}
NVRC=${CURRENT}/nvimrc
for ITEM in nvimrc cocrc coc-settings.json
do
	ln -snf ${CURRENT}/${ITEM} ${NVCONF_DIR}/${ITEM}
done
NVINIT=${NVCONF_DIR}/init.vim
echo "source ${CURRENT}/nvimrc" > ${NVINIT}
echo "\"source ${CURRENT}/cocrc" >> ${NVINIT}

