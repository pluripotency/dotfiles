#! /bin/bash
if [ -z "`command -v git`" ]; then
  echo 'installing git'
  [ ! -z "`command -v yum`" ] && sudo yum install -y git
  [ ! -z "`command -v apt`" ] && sudo apt update && sudo apt install -y git
fi
echo 'installing uv'
[ -z "`command -v uv`" ] && curl -LsSf https://astral.sh/uv/install.sh | sh
sed -i '/alias activate=/d' ~/.bashrc
echo 'alias activate=". .venv/bin/activate"' >> ~/.bashrc
echo 'uv and git are ready.'
