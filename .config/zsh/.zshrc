# Set the PS1 value using __git_ps1.
source git-prompt 
set -o PROMPT_SUBST
PS1='%1~$(__git_ps1) %(!.#.$) '

# History settings.
HISTFILE=$HOME/.config/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

# Use emacs keybindings.
bindkey -e

# Automatic cd, do not beep, suppress ls error, do not ask confirmation for rm
# and enable extended globbing.
set -o autocd
set -o No_Beep
set +o nomatch
set -o rm_star_silent
set -o extended_glob

# Shift-Tab moves through the completion menu backwards.
bindkey '^[[Z' reverse-menu-complete

# Auto completion of commands with case insensitive.
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Autosuggestions plugin.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Search substring history with C-P and C-N without duplicates.
set -o HIST_IGNORE_ALL_DUPS
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Load all the aliases and the shortcuts to files and dirs.
CONFIG=$HOME/.config/shortcuts
[ -f $CONFIG/shortcutrc ] && source $CONFIG/shortcutrc # Shortcuts to files and dirs.
[ -f $CONFIG/aliasrc ]    && source $CONFIG/aliasrc    # Functions and other aliases.
