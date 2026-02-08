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

def wrap_bash(func_params=None):
    me = base_node.Me()
    @session_wrap.bash(me, log_params=create_log_params())
    def inner(session=None):
        line = 'eval "$(uv generate-shell-completion bash)"'
        base_shell.append_bashrc(session, line)

        base_shell.work_on(session, DOTDIR_PATH)
        func = None
        if func_params:
            if 'func' in func_params:
                func = func_params['func']
            pkgs = ['vim', 'tmux']
            if 'pkgs' in func_params:
                pkgs += func_params['pkgs']
        platform = me.platform
        if platform:
            if base_node.is_platform_rhel(platform):
                base_shell.run(session, 'sudo yum install -y ' + ' '.join(pkgs))
            elif platform.startswith('ubuntu'):
                base_shell.run(session, 'sudo apt update && sudo apt install -y ' + ' '.join(pkgs))
        base_shell.run(session, f'bash {DOTDIR_PATH}/dotsetup.sh')
        if func and callable(func):
            func(session)
    return inner

def install_nvim():
    def inner(session):
        nvim.install_appimage()(session)
        base_shell.run(session, f'bash {DOTDIR_PATH}/nvsetup.sh')
    return {'func': inner}

def setup():
    menu_func_list = [
        ["vim, tmux", wrap_bash()],
        ["vim, tmux, nvim(uv)", wrap_bash(install_nvim())],
    ]
    num = choose_num([item[0] for item in menu_func_list])
    if get_y_n(f"Do you want to setup {menu_func_list[num][0]}"):
        menu_func_list[num][1]()

if __name__ == "__main__":
    setup()

