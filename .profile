#!/usr/bin/env bash
# Profile file runs on login. This file is activated by the shell (bash or fish).

# Adds '~.local/bin/' and all subdirectories to $PATH.
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Set all the other environment variables.
export EDITOR="vim"
export SUDO_EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
