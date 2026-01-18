import re
ex_redhat_platform = [
    ['AlmaLinux release 9.7 (Moss Jungle Cat)', 'almalinux9'],
    ['AlmaLinux release 8.1 (Moss Jungle Cat)', 'almalinux8'],
    ['CentOS Linux release 7.3', 'centos7'],
]
ex_issue_platform = [
    ['Ubuntu 22.04', 'ubuntu jammy'],
    ['Ubuntu 24.04', 'ubuntu noble'],
    ['Arch Linux', 'arch'],
]

def get_redhat_platform(redhat_platform_str):
    """
    >>> [get_redhat_platform(ex[0]) == ex[1] for ex in ex_redhat_platform] == [True for ex in ex_redhat_platform]
    True
    """
    match = re.search(r'AlmaLinux release (\d{1,2})\.', redhat_platform_str)
    if match:
        return f'almalinux{match.group(1)}'
    match = re.search(r'CentOS Linux release (\d{1,2})\.', redhat_platform_str)
    if match:
        return f'centos{match.group(1)}'

def get_issue_platform(issue_platform_str):
    """
    >>> [get_issue_platform(ex[0]) == ex[1] for ex in ex_issue_platform] == [True for ex in ex_issue_platform]
    True
    """
    match = re.search(r'Ubuntu (\d{1,2})\.', issue_platform_str)
    if match:
        udist_num_str = match.group(1)
        if udist_num_str == '22':
            return 'ubuntu jammy'
        elif udist_num_str == '24':
            return 'ubuntu noble'
        else:
            return 'ubuntu'
    match = re.search(r'Arch Linux', issue_platform_str)
    if match:
        return 'arch'
