from mini.menu import get_y_n
from mini.ansi_colors import cyan
from plur_dotfiles.lib import helper
from plur_dotfiles.platform_run import installer

def setup():
    description = """
    This will install
    vim, tmux, python(uv), nodejs(by nodebrew), zoxide
    """
    print(cyan(description))
    if get_y_n("Do you want to continue?"):
        helper.on_bash(installer.install_vim_tmux_zoxide_nvim)()

if __name__ == "__main__":
    setup()

