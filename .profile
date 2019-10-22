#!/usr/bin/env bash

# Adds '~.local/bin/' and all subdirectories to $PATH.
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# TODO Remove when Data Mining is over...
export PATH="$PATH:$HOME/builds/anaconda/pkg/anaconda/opt/anaconda/bin"

# Set all the other environment variables.
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
