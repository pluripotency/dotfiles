import os
import sys
from mini.ansi_colors import red
from plur import base_shell
from plur_dotfiles.clitools import nvim, tmux
DOTDIR_PATH = os.environ.get('DOTDIR_PATH') 
if not DOTDIR_PATH:
    print(red('env DOTDIR_PATH is needed'))
    sys.exit(1)

def install_vim_tmux_zoxide_nvim(session):
    if session.platform == 'almalinux10':
        pkgs = ['vim', 'fzf']
        tmux.install_tmux_appimage()(session)
        base_shell.run(session, 'curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh')
    else:
        pkgs = ['vim', 'tmux', 'zoxide', 'fzf']
    nvim.install_appimage(additional_pkgs=pkgs)(session)
    lines = [
        'eval "$(uv generate-shell-completion bash)"',
        'eval "$(zoxide init bash)"'
    ]
    _ = [base_shell.append_bashrc(session, line) for line in lines]
    tmux.setup_tmux(session)
    base_shell.run(session, f'bash {DOTDIR_PATH}/dotsetup.sh')
    base_shell.run(session, f'bash {DOTDIR_PATH}/nvsetup.sh')

