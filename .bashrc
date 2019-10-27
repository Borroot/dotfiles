# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Run the .profile file (if available).
[[ -f ~/.profile ]] && . ~/.profile

# Show git repo using __git_ps1.
source git-prompt
PS1='bash \W$(__git_ps1) $ '

# Unlimited history
HISTSIZE=-1
HISTFILESIZE=-1

# Load all the aliases and the shortcuts to files and dirs.
[ -f "$HOME/.config/shortcuts/shortcutrc" ] && source "$HOME/.config/shortcuts/shortcutrc" # Shortcuts to files and dirs.
