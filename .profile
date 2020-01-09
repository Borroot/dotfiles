# Adds '~/.local/bin/' and all direct subdirectories to $PATH.
export PATH="$PATH:$(du $HOME/.local/bin/ | cut -f2 | tr '\n' ':' | sed 's/:$//')"

# Program specifics.
export _JAVA_AWT_WM_NONREPARENTING=1 # intellij
export PATH="$PATH:$HOME/builds/anaconda/pkg/anaconda/opt/anaconda/bin"

# Set all the default programs.
export EDITOR=nvim
export TERMINAL=st
export READER=zathura
export VIEWER=sxiv
export BROWSER=qutebrowser

# Home folder cleanup.
export ZDOTDIR=$HOME/.config/zsh

# Swap ctrl-caps and add the missing key (in tty).
sudo loadkeys $HOME/.config/keymap/my-keys.map
