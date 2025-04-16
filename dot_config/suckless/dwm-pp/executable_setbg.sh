#!/bin/sh

echo "Choosing a random wallpaper ..."
wall=$(find $HOME/Pictures/Wallpapers -type f | shuf -n 1)
echo "Setting wallpaper ..."
xwallpaper --zoom $wall
echo "Generating pywal color-scheme ..."
wal -i $wall >/dev/null
sed -i 'N;$!P;D' $HOME/.cache/wal/colors-wal-dwm.h
echo "Recompiling DWM with colors ..."
(cd $HOME/.config/suckless/dwm && sudo make clean install >/dev/null)
echo "Restart DWM for new colors! (Mod-Shft-Ctrl-q)"
