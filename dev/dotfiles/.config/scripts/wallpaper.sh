#!/bin/bash

WALLPAPERS_DIR=$HOME/Wallpapers
LOG_FILE_PATH=$HOME/dev/dotfiles/.config/scripts/wallpapers.log

touch $LOG_FILE_PATH

ls $WALLPAPERS_DIR |sort -R |tail -1 |while read file; do
    echo "$WALLPAPERS_DIR/$file" >> $LOG_FILE_PATH 2>&1
    $HOME/.pyenv/shims/wal -i $WALLPAPERS_DIR/$file >> $LOG_FILE_PATH 2>&1
done
