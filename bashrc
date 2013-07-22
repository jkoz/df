#!/bin/bash

#set -x

export HISTCONTROL=ignoreboth:erasedups # no duplicate entries
export PROMPT_COMMAND="history -a" # update histfile after every command
export HISTSIZE=10000
export HISTIGNORE="&:[ ]*:exit"
export GREP_OPTIONS="--color"

#shopt -s histappend # append history file

test "$UID" -eq 0 && export PS1="\e[01;31m# \e[0m" || export PS1="$ "

export EDITOR="vim"

# x
[ -n "$DISPLAY" ] && xset r rate 300 50

# tmux
[ -n "$TMUX" ] && TERM=xterm-256color

# svn
export SVN_EDITOR="$EDITOR --nofork";

# override some command base on type of unix
test -f /etc/debian_version && alias ack='ack-grep'

# projects directory
export PROJ=$HOME/projects

# source files in ~/.bashrc
for file in `find ~/.bashrc.d/ -type f | grep bash$`; do
    . "$file"
done
