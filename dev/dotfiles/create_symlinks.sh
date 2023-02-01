#! /usr/bin/env bash

DIRECTORIES=("." "./.config")
EXCLUDED=("create_symlinks.sh" "install_stuff.sh")

find . -maxdepth 1 -not -type d| while read file; do
    if [[ " ${EXCLUDED[*]} " =~ ${file} ]]; then
        echo "Skipping $file"
        continue
    fi
    echo "'ln -sf "$PWD"/"$file" "$HOME"/"$file"'"
    # ln -sf "$PWD"/"$DIR"/"$file" "$HOME"/"$DIR"/"$file"
done;

find ./.config -maxdepth 1| while read file; do
    if [[ " ${EXCLUDED[*]} " =~ " ${file} " ]]; then
        echo "Skipping $file"
        continue
    fi
    echo "'ln -sf "$PWD"/"$file" "$HOME"/"$file"'"
    # ln -sf "$PWD"/"$DIR"/"$file" "$HOME"/"$DIR"/"$file"
done;