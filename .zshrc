# Run the .profile file (if available).
[[ -f ~/.profile ]] && source ~/.profile

# History settings.
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Automatic cd, do not beep and use emacs keybindings.
setopt autocd
setopt No_Beep
bindkey -e

# Auto completion of commands with case insensitive.
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Autosuggestions plugin.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Search substring history with C-P and C-N.
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Load all the aliases and the shortcuts to files and dirs.
[ -f "$HOME/.config/shortcuts/shortcutrc" ] && source "$HOME/.config/shortcuts/shortcutrc" # Shortcuts to files and dirs.
[ -f "$HOME/.config/shortcuts/aliasrc" ] && source "$HOME/.config/shortcuts/aliasrc"       # Functions and other aliases.
