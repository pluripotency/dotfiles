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
for ITEM in nvimrc cocrc coc-settings.json
do
	ln -snf ${CURRENT}/${ITEM} ${NVCONF_DIR}/${ITEM}
done
echo "source ${CURRENT}/nvimrc" > ${NVCONF_DIR}/init.vim
echo "\"source ${CURRENT}/cocrc" >> ${NVCONF_DIR}/init.vim

