setopt histignorealldups sharehistory

# jobs background will not be kill if exit its session
setopt NO_HUP
unsetopt HUP

# projects
export PROJECT="$HOME/data/projects"
export CATALINA_HOME="${PROJECT}/apache-tomcat-8.0.5/"
export DOTFILE_HOME="${PROJECT}/dotfiles"
export AXS_HOME="${PROJECT}/axs"
export MEDIA_HOME="$HOME/media"
export VIDEO_HOME="$MEDIA_HOME/video"

# Default Programs
#export NMON=cmknt
export EDITOR="vim"
export PAGER="less"
export BROWSER="firefox"
export MOVPLAY="mplayer"
export PICVIEW="feh"
export SNDPLAY="mplayer"
export TERMINAL="urxvt"

bindkey -v
bindkey ^R history-incremental-pattern-search-backward
bindkey ^S history-incremental-pattern-search-forward

bindkey '^p'    up-line-or-history
bindkey '^n'    down-line-or-history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Map Ctrl-S to sth usefull other than XOFF (interrupt data flow).
stty -ixon

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# x
[ -n "$DISPLAY" ] && xset r rate 300 50

# auto cd
autoenv_cd () {
    builtin cd $@

    if test "`pwd`" = "${AXS_HOME}" -a x"${axs_home_reload}" = x ; then
        echo "loading env for axs..."
        # init axs plugins/theme
        plugins=(ams autoenv git jira vi-mode svn safe-paste)
        ZSH_THEME="ams"

        # reload it
        reload_zsh_plugin

        # before reload use in ams plugin
        before_autoenv_cd

        # mark it, avoid load again
        axs_home_reload=1
    fi
}

# overide in oh-my-zsh plugin
before_autoenv_cd() {
}

#scim
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"


# man pages colors
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

######################################################################################
# oh my zsh
ZSH=$HOME/.oh-my-zsh
if test "$UID" -eq 0
then
    plugins=(git jira vi-mode svn safe-paste)
    ZSH_THEME="imajes"
else
    plugins=(autoenv git jira vi-mode svn safe-paste)
    ZSH_THEME="gallois"
fi
source $ZSH/oh-my-zsh.sh

### alias ####
# projects
alias pA='cd $AXS_HOME'

# torrent
tV() { cd ${VIDEO_HOME}; rtorrent "$@"; }

# Packages
alias extract='dtrx'
alias gz='tar -xzf'
alias xz='tar -xJf'
alias bz='tar -xvjf'

# Pacman
alias UU='packer-color -Syyu'
alias UUA='yaourt -Syyua --devel'
alias P='packer-color'
alias PI='packer-color -S'
alias Y='yaourt'
alias pac='sudo pacman -S'
alias pac-r='sudo pacman -R'
alias Log='tail -f /var/log/pacman.log'

## System
alias shutdown='sudo shutdown -P now'
alias Stat='uname -a;systemd-analyze time;wc -l /lib/modules/$(uname -r)/modules.order;lsinitcpio -a /boot/initramfs-linux.img'
alias laptop-mode='grep -r '^\(CONTROL\|ENABLE\)_' /etc/laptop-mode/conf.d'
alias keys='xev'
alias bub='say en beau is a bunkace'
alias unblock-wireless='rfkill unblock all && ifconfig set wlp3s0 up'

## Directories
alias space='ncdu'
alias space-color='cdu'
alias ll='ls -l'
alias la='ls -ltra'
alias l='ls'
alias C='clear'
alias se='sudo vim'
alias e='vim'
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias k='exit'
alias te='trash-empty'
alias tl='trash-list'
alias del='trash-put'
alias tr='trash-rm'
alias lsTrash='ls ~/.local/share/Trash/files/'
alias cdTrash='cd ~/.local/share/Trash/files/'
alias lD='ls ~/Downloads'
alias D='cd ~/Downloads'

# update dotfile
alias uD="cd ${DOTFILE_HOME} && ./INSTALL"

# aliases
alias l='ls --color=auto'
alias ll='ls -la --color=auto'
alias mutt='TERM=screen-256color mutt'
alias irssi='TERM=screen-256color irssi'
alias b='mvn clean install -Dtest'
alias e='mvn eclipse:clean eclipse:eclipse'

# X Resources Stuff
alias eX='vim ${DOTFILE_HOME}/.Xresources; uD'
alias XTR='xrdb -merge ~/.Xresources'

# Edit zshrc
alias eZ='vim ${DOTFILE_HOME}/zshrc; uD'

# i3
alias eI='vim ${DOTFILE_HOME}/i3/config; uD'

# Vim Stuff
alias eV='vim ${DOTFILE_HOME}/vimrc; uD'
alias e='vim'

# Rip CDs
alias CDinfo='cdparanoia -vsQ'
alias rip='cdparanoia -B'
alias mp3='for t in track{01-14}*.wav; do lame -b 320 $t; done'

# News and Music
alias MP='ncmpcpp'
alias news='newsbeuter'
alias nix='cortex linux'
alias pods='podbeuter'
alias twit='turses'

# Multimedia
alias irc='weechat-curses'
alias M='mplayer -vo x11 -fs -zoom'
alias Vids='cd ~/Downloads/.blackbox && ranger'

# Google Calenar
alias gcal-week='gcalcli --width 12 calw'
alias gcal='gcalcli --width 12 calm'
alias gcal-add='gcalcli quick'
alias gcal-agenda='gcalcli agenda'

### function ###
# auto load oh-my-zsh plugin
is_plugin() {
    local base_dir=$1
    local name=$2
    test -f $base_dir/plugins/$name/$name.plugin.zsh \
        || test -f $base_dir/plugins/$name/_$name
}

reload_zsh_plugin() {
    #echo "Reload zsh plugin"
    # Load and run compinit
    autoload -U compinit
    compinit -i

    # Add all defined plugins to fpath. This must be done before running compinit.
    for plugin ($plugins); do
        if is_plugin $ZSH_CUSTOM $plugin; then
            fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
        elif is_plugin $ZSH $plugin; then
            fpath=($ZSH/plugins/$plugin $fpath)
        fi
    done

    # Two lines here I think we can disregard
    # Load all of the plugins that were defined in ~/.zshrc
    for plugin ($plugins); do
        if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
            source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
        elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
            source $ZSH/plugins/$plugin/$plugin.plugin.zsh
        fi
    done

    source $ZSH/themes/${ZSH_THEME}.zsh-theme
}

# scribd
scribd () {
    url=$1
    ak=`wget -q -O- $url | grep  access_key  | sed -e 's/\(.*\)key-\(.*\)\"/\2/' | cut -d'"' -f1 | \
    xargs echo "key-" | sed 's/ //g'` && docid=`echo $url | cut -d'/' -f5` && \ 
    chromium-browser "http://d1.scribdassets.com/ScribdViewer.swf?document_id=${docid}&access_key=${ak}"
}

source ~/.fzf.zsh
