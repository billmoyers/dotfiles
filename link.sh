#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILES="
	bashrc
	vimrc
	tmux.conf
	tmuxp
"

for f in $FILES; do 
	ln -s -i $DIR/$f $HOME/.$f
done

for f in $HOME/.mozilla/firefox/*.default/chrome; do
	ln -s -i $DIR/firefox/profile/chrome/userChrome.css "$f"
done
