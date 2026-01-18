#! /bin/bash
CURRENT=$(cd $(dirname $0);pwd)
cd $CURRENT
bash install_uv.sh
uv run src/plur_dotfiles/main.py
