#!/usr/bin/env sh

[ -f $HOME/.config/xorg/xprofile ] && source $HOME/.config/xorg/.xprofile
exec dwm
