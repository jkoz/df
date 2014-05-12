setopt histignorealldups sharehistory

# jobs background will not be kill if exit its session
setopt NO_HUP
unsetopt HUP

export  CATALINA_HOME="/home/tait/data/projects/apache-tomcat-8.0.5/"

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

export EDITOR="vim"

# x
[ -n "$DISPLAY" ] && xset r rate 300 50

autoenv_cd () {
    builtin cd $@
}

#scim
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"

# aliases
alias l='ls --color=auto'
alias ll='ls -la --color=auto'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias mutt='TERM=screen-256color mutt'
alias irssi='TERM=screen-256color irssi'
alias b='mvn clean install -Dtest'
alias e='mvn eclipse:clean eclipse:eclipse'

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
    plugins=(ams autoenv git jira vi-mode svn safe-paste)
    ZSH_THEME="ams"
fi
source $ZSH/oh-my-zsh.sh
