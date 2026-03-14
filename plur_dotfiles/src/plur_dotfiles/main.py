from mini.menu import choose_num, get_y_n
from mini import misc
from plur import base_shell
from plur import base_node
from plur import session_wrap
from plur_dotfiles import nvim
DOTDIR_PATH = '~/dotfiles'

def create_log_params():
    now = misc.now()
    ymd = misc.get_ymd(now)
    hms_f = misc.get_hms_f(now)
    log_dir = '/tmp/plur_dotfiles_log'
    log_params = {
        'log_dir': log_dir,
        'enable_stdout': True,
        'output_log_file_path': f'{log_dir}/{ymd}/output_{hms_f}.log',
        'dont_truncate': False,
        'debug_color': True,
        'debug_log_file_path': f'{log_dir}/{ymd}/debug_{hms_f}.log',
        'delete_mtime_unit': 'day',
        'delete_mtime': 10,
    }
    return log_params

def install_vim_tmux_zoxide_nvim():
    me = base_node.Me()
    @session_wrap.bash(me, log_params=create_log_params())
    def inner(session):
        line = 'eval "$(uv generate-shell-completion bash)"'
        base_shell.append_bashrc(session, line)
        pkgs = ['vim', 'tmux', 'zoxide']
        nvim.install_appimage(additional_pkgs=pkgs)(session)
        base_shell.run(session, f'bash {DOTDIR_PATH}/dotsetup.sh')
        base_shell.run(session, f'bash {DOTDIR_PATH}/nvsetup.sh')
    return {'func': inner}

def setup():
    menu_func_list = [
        ["vim, tmux, zoxide, nvim(uv)", install_vim_tmux_zoxide_nvim],
    ]
    num = choose_num([item[0] for item in menu_func_list])
    if get_y_n(f"Do you want to setup {menu_func_list[num][0]}"):
        menu_func_list[num][1]()

if __name__ == "__main__":
    setup()

