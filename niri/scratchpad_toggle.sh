#!/usr/bin/env sh
SP_NAME="$1"
. $HOME/.config/niri/lib_scratchpad.sh

on_sp() {
	niri msg action focus-workspace $PREV_WS
}

off_sp() {
	niri msg action focus-workspace $SP_NAME
}

go
