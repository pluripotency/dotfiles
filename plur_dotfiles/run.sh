#! /bin/bash
CURRENT=$(cd $(dirname $0);pwd)
bash $CURRENT/install_uv.sh
# uv python install 3.13
# uv python pin 3.13
uv run src/plur_dotfiles/main.py
