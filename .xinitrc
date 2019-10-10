#!/usr/bin/env bash

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec dwm
