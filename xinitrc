usermodmap=$HOME/.Xmodmap

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xdefaults ] && xrdb ~/.Xdefaults

exec openbox-session
exec urxvt
