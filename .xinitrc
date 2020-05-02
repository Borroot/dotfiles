#!/usr/bin/env bash
# AUTHOR: Bram Pulles

[[ -f $HOME/.config/xorg/xprofile ]] && source $HOME/.config/xorg/xprofile
exec dwm
