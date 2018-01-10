#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILES="
	bashrc
	vimrc
	tmux.conf
	tmuxp
"

for f in $FILES; do 
	ln -s $DIR/$f $HOME/.$f
done


