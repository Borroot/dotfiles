# Adds '~/.local/bin/' and all direct subdirectories to $PATH.
export PATH="$PATH:$(du $HOME/.local/bin/ | cut -f2 | tr '\n' ':' | sed 's/:$//')"

# Program specifics.
export _JAVA_AWT_WM_NONREPARENTING=1 # intellij
export PATH="$PATH:$HOME/builds/pycharm-community-2019.3.4/bin/"
export PATH_TO_FX="/usr/lib/jvm/javafx-sdk-11.0.2/lib"

# Set all the default programs.
export EDITOR=nvim
export TERMINAL=alacritty
export READER=zathura
export VIEWER=sxiv
export BROWSER=qutebrowser

# Home folder cleanup.
export ZDOTDIR=$HOME/.config/zsh

# Swap ctrl-caps and add the missing key (in tty).
sudo loadkeys $HOME/.config/keymap/my-keys.map
