# Adds '~/.local/bin/' and all direct subdirectories to $PATH.
export PATH="$PATH:$(find $HOME/.local/bin/ -mindepth 1 -maxdepth 1 -type d \
                   | tr '\n' ':' | sed 's/:$//')"

# Program specifics.
export _JAVA_AWT_WM_NONREPARENTING=1 # intellij

# Set all the default programs.
export EDITOR=nvim
export TERMINAL=alacritty
export READER=zathura
export VIEWER=sxiv
export PLAYER=mpv
export MAIL=neomutt
export BROWSER=qutebrowser

# Home folder cleanup.
export ZDOTDIR=$HOME/.config/zsh

# Swap ctrl-caps and add the missing key (in tty).
sudo loadkeys $HOME/.config/keymap/my-keys.map
