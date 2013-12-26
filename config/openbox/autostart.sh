x11vnc -shared -rfbport 5900 -forever -usepw -display :0.0 -bg
xlock -mode blank
/usr/X11R6/bin/xautolock -locker  "xlock -mode blank" -corners 0+00  -cornerdelay 1 &
tint2 &
conky &
#urxvt -e bash -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME" &
urxvt
feh --bg-scale ~/Downloads/media/wallpapers/1285774.jpg &
/usr/bin/mail-notification &
fetchmail -vk
#/usr/local/oald8/oald8 &
#thunderbird &
