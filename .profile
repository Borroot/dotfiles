# Adds '~/.local/bin/' and all direct subdirectories to $PATH.
export PATH="$PATH:$(du $HOME/.local/bin/ | cut -f2 | tr '\n' ':' | sed 's/:$//')"

# Program specifics.
export _JAVA_AWT_WM_NONREPARENTING=1 # intellij
export PATH="$PATH:$HOME/builds/anaconda/pkg/anaconda/opt/anaconda/bin"

# Set all the default programs.
export EDITOR=vim
export TERMINAL=st
export READER=zathura
export BROWSER=qutebrowser

# Set the locale to C (equivalent to POSIX).
export LC_ALL=C

# Home folder cleanup.
export ZDOTDIR=$HOME/.config/zsh

# Swap ctrl-caps and add the missing key (in tty).
sudo loadkeys $HOME/.config/keymap/my-keys.map
