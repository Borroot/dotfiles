# History settings.
HISTFILE=~/.zsh/.histfile
HISTSIZE=100000
SAVEHIST=100000

# Go to a folder when only a folder is given.
setopt autocd

# DO NOT BEEP!
unsetopt beep

# Use vim keybindings.
bindkey -v

# Auto completion of commands.
zstyle :compinstall filename '/home/borroot/.zshrc'
autoload -Uz compinit
compinit
