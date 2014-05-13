usermodmap=$HOME/.Xmodmap

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
xrdb ~/.Xresources

#exec openbox-session
exec i3
