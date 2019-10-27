# Set the PS1 value using __git_ps1.
source git-prompt 
setopt PROMPT_SUBST
PS1='%1~$(__git_ps1) %(!.#.$) '

# History settings.
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Use emacs keybindings.
bindkey -e

# Automatic cd, do not beep and suppress ls error.
setopt autocd
setopt No_Beep
setopt +o nomatch

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
setopt HIST_IGNORE_ALL_DUPS
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Load all the aliases and the shortcuts to files and dirs.
[ -f "$HOME/.config/shortcuts/shortcutrc" ] && source "$HOME/.config/shortcuts/shortcutrc" # Shortcuts to files and dirs.
[ -f "$HOME/.config/shortcuts/aliasrc" ] && source "$HOME/.config/shortcuts/aliasrc"       # Functions and other aliases.
