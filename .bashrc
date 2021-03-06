# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Set the PS1 value.
source git-prompt
PS1='[bash] \W$(__git_ps1) $ '

# Unlimited history
HISTSIZE=-1
HISTFILESIZE=-1

# Load all the aliases and the shortcuts to files and dirs.
CONFIG=$HOME/.config/shortcuts
[ -f $CONFIG/shortcutrc ] && source $CONFIG/shortcutrc # Shortcuts to files and dirs.
