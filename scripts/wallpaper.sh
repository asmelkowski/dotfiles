WALLPAPERS_DIR=$HOME/Wallpapers

ls $WALLPAPERS_DIR |sort -R |tail -1 |while read file; do
    wal -i $WALLPAPERS_DIR/$file -q
done
