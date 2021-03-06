#!/usr/bin/env python

import i3
import subprocess

def i3clients():
    clients = {}
    for ws_num in range(1,11):
        workspace = i3.filter(num=ws_num)
        if not workspace:
            continue
        workspace = workspace[0]
        windows = i3.filter(workspace, nodes=[])
        instances = {}
        # Adds windows and their ids to the clients dictionary
        for window in windows:
            win_str = '[%s] %s' % (workspace['name'], window['name'])
            # Appends an instance number if other instances are present
            if win_str in instances:
                instances[win_str] += 1
                win_str = '%s (%d)' % (win_str, instances[win_str])
            else:
                instances[win_str] = 1
            clients[win_str] = window['id']
    return clients

def win_menu(clients, l=10):
    #-fn Inconsolata-10  -nb #555753 -nf #D3D7DF -sb #2E3436 -sf #EEEEEC
    dmenu = subprocess.Popen(['dmenu','-i', '-t', '-l', str(l), "-fn", "Inconsolata-11"],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE)

    #dmenu = subprocess.Popen(['ruby', '/home/tait/data/projects/fzf/fzf'],
            #stdin=subprocess.PIPE,
            #stdout=subprocess.PIPE)
    menu_str = '\n'.join(sorted(clients.keys()))
    # Popen.communicate returns a tuple stdout, stderr
    win_str = dmenu.communicate(menu_str.encode('utf-8'))[0].decode('utf-8').rstrip()
    return clients.get(win_str, None)

if __name__ == '__main__':
    clients = i3clients()
    win_id = win_menu(clients)
    if win_id:
        i3.focus(con_id=win_id)
