WALLPAPERS_DIR=$HOME/Wallpapers

ls $WALLPAPERS_DIR |sort -R |tail -$N |while read file; do
    wal -i $WALLPAPERS_DIR/$file -q
done
