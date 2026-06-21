from mini import misc
from plur import base_node
from plur import session_wrap

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

def on_bash(func):
    me = base_node.Me()
    @session_wrap.bash(me, log_params=create_log_params())
    def inner(session):
        func(session)
    return inner

