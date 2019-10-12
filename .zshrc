# Run the .profile file (if available).
[[ -f ~/.profile ]] && source ~/.profile

# History settings.
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Go to a folder when only a folder is given.
setopt autocd
# DO NOT BEEP!
unsetopt beep
# Use emacs keybindings.
bindkey -e

# Auto completion of commands.
zstyle :compinstall filename '/home/borroot/.zshrc'
autoload -Uz compinit
compinit

# Autosuggestions plugin.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Load all the aliases and the shortcuts to files and dirs.
[ -f "$HOME/.config/shortcuts/shortcutrc" ] && source "$HOME/.config/shortcuts/shortcutrc" # Shortcuts to files and dirs.
[ -f "$HOME/.config/shortcuts/aliasrc" ] && source "$HOME/.config/shortcuts/aliasrc"       # Functions and other aliases.
