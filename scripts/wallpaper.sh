#!/bin/bash

WALLPAPERS_DIR=$HOME/Wallpapers

ls $WALLPAPERS_DIR |sort -R |tail -1 |while read file; do
    echo "$WALLPAPERS_DIR/$file" >> $HOME/dev/dotfiles/scripts/wallpapers.log 2>&1
    /home/prv/.pyenv/shims/wal -i $WALLPAPERS_DIR/$file >> $HOME/dev/dotfiles/scripts/wallpapers.log 2>&1
done
