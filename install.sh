#!/usr/bin/env bash

echo this script MUST be run from the cloned dotfiles directory
echo if it is not press Ctrl+c NOW to exit the script as it may have unintended consequences
echo the script will run in 5 seconds
sleep 5

files=$(command ls)

echo Backing up old config files
for file in $files; do
	if [ -d "$HOME/.config/$file" ]; then
		if [ -L "$HOME/.config/$file" ]; then
			echo "$HOME/.config/$file is a symlink, removing it"
			rm "$HOME/.config/$file"
		elif [ ! -d "$HOME/.config/$file.bak" ]; then
			echo Moving \"$HOME/.config/$file\" to \"$HOME/.config/$file.bak\" 
			mv "$HOME/.config/$file" "$HOME/.config/$file.bak"
		else
			echo "$HOME/.config/$file.bak already exists and $HOME/.config/$file is not a symlink"
			exit 1
		fi
	fi
done

echo Linking new config
for file in $files; do
	echo Linking "$PWD/$file" to "$HOME/.config/$file"
 
	ln -s "$PWD/$file" "$HOME/.config/"
done

echo Done!
