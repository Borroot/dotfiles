# Run the .profile file (if available).
[[ -f ~/.profile ]] && source ~/.profile

# History settings.
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

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

# TODO Move this to a functions file.
c() { cd "$1" && ls; }
s() { sudo tee /proc/acpi/bbswitch <<<ON && startx; }
#git remote set-url origin git@github.com:$(username)/$(reponame).git

# Open pdf with zathura. You do not see the output and can close the terminal. (':' does nothing, literally)
pdf() { zathura "$1" &> /dev/null & :; }
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'disown -a -h'

# TODO Move this to an alias file.
# Brightness settings (only use this when the normal keys don't suffice).
alias b='echo $1 > /sys/class/backlight/intel_backlight/brightness'
alias l='ls -alFh'
alias ls='ls --color=always'
