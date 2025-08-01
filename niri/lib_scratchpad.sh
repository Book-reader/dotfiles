#!/usr/bin/env sh
CURR_WS=$(niri msg workspaces | grep '*')
WS_ID=$(echo "$CURR_WS" | awk '{print $2}')
WS_NAME=$(echo "$CURR_WS" | awk '{print $3}')
if [ -z "$PREV_WS_FILE" ]; then
	PREV_WS_FILE="$HOME/.config/niri/prev_ws"
fi
PREV_WS=$(cat "$PREV_WS_FILE")
if [ -z "$SP_LIST_FILE" ]; then
	SP_LIST_FILE="$HOME/.config/niri/sp_list"
fi
SP_LIST=$(cat "$SP_LIST_FILE")


is_curr_sp() {
	if [ "$WS_NAME" = "\"$SP_NAME\"" ]; then
		return 0
	else
		return 1
	fi
}

is_sp() {
	for sp in $SP_LIST; do
			if [ "$WS_NAME" = "\"$sp\"" ]; then
				return 0
			fi
	done
	return 1
}

go() {
	if is_curr_sp; then
		on_sp
	else
		if ! is_sp; then
			echo $WS_ID > "$PREV_WS_FILE"
		fi
		off_sp
	fi
}
