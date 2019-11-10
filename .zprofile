# Adds '~/.local/bin/' and all direct subdirectories to $PATH.
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Program specifics.
export _JAVA_AWT_WM_NONREPARENTING=1 # intellij
export PATH="$PATH:$HOME/builds/anaconda/pkg/anaconda/opt/anaconda/bin"

# Set all the other environment variables.
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

# Swap the control and capslock key in the console (not in X).
[ -f ~/.config/keymap/swap-ctrl-caps.map ] && sudo loadkeys ~/.config/keymap/swap-ctrl-caps.map
