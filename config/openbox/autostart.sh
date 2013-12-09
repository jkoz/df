feh --bg-scale ~/Downloads/media/wallpapers/1285774.jpg
ntpd -q &
urxvt &
tint2 &
x11vnc -shared -rfbport 5900 -forever -usepw -display :0.0 -bg
/usr/bin/mail-notification &
fetchmail -vk
#/usr/local/oald8/oald8 &
#thunderbird &
