# ----------------------------------------------------------------------
# NORMAL SETTINGS
# ----------------------------------------------------------------------

# Set the PS1 value using __git_ps1.
source git-prompt
set -o PROMPT_SUBST
PS1='%1~$(__git_ps1) %(!.#.$) '
PS3='> '

# History settings.
HISTFILE=$HOME/.config/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

# Automatic cd, do not beep, suppress ls error, do not ask confirmation for rm
# and enable extended globbing.
set -o autocd
set -o No_Beep
set +o nomatch
set -o rm_star_silent
set -o extended_glob

# Auto completion is case insensitive and has a nice menu.
autoload -Uz compinit && compinit
zmodload zsh/complist
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Autosuggestions plugin.
PLUG=/usr/share/zsh/plugins
source $PLUG/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUG/zsh-history-substring-search/zsh-history-substring-search.zsh

# Load all the aliases and the shortcuts to files and dirs.
CONFIG=$HOME/.config/shortcuts
[ -f $CONFIG/shortcutrc ] && source $CONFIG/shortcutrc # Shortcuts to files and dirs.
[ -f $CONFIG/aliasrc ]    && source $CONFIG/aliasrc    # Short functions and aliases.
[ -f $CONFIG/functionrc ] && source $CONFIG/functionrc # Big functions.

# ----------------------------------------------------------------------
# VI MODE SETTINGS
# ----------------------------------------------------------------------

bindkey -v

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Search substring history without duplicates.
set -o HIST_IGNORE_ALL_DUPS
bindkey -M vicmd 'k'  history-substring-search-up
bindkey -M vicmd 'j'  history-substring-search-down
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down

# Set all of the settings for the correct cursor depeninding on the vi mode.
# Instant changing from beam to block cursor.
export KEYTIMEOUT=1

# Start with a beam cursor (aka insert mode).
zle-line-init() {
	zle -K viins
	echo -ne "\e[5 q"
}
zle -N zle-line-init

# Change the cursor when the vi mode is changed.
function zle-keymap-select {
	case $KEYMAP in
		vicmd)      echo -ne '\e[1 q' ;;
		viins|main) echo -ne '\e[5 q' ;;
	esac
}
zle -N zle-keymap-select
