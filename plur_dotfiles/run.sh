#! /bin/bash
CURRENT=$(cd $(dirname $0);pwd)
cd $CURRENT
bash install_uv.sh
DOTDIR_PATH=$CURRENT/.. uv run src/plur_dotfiles/main.py
