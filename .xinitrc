#!/usr/bin/env sh
# AUTHOR: Bram Pulles

[ -f $HOME/.config/xorg/xprofile ] && source $HOME/.config/xorg/xprofile
exec dwm
