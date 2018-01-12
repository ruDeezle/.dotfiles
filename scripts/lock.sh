#!/bin/bash

# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

lock='/home/amariya/pictures/lock.png'
image=$(mktemp --suffix=.png)
trap 'rm -f "$image"' EXIT INT TERM

maim -u \
  | convert png:- -scale 10% -scale 1000% png:- \
  | convert png:- "$lock" -gravity center -composite -matte "$image"

i3lock -e -i "$image" \
  --insidecolor=EBDBB233 --ringcolor=282828FF --linecolor=EBDBB2FF \
  --keyhlcolor=EBDBB2FF --bshlcolor=FB4934FF --separatorcolor=282828FF \
  --insidevercolor=FABD2FFF --insidewrongcolor=FB4934FF \
  --ringvercolor=282828FF --ringwrongcolor=282828FF --indpos='x+100:y+720' \
  --radius=32 --ring-width=4 --veriftext='' --wrongtext=''

# sleep 0.5
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:no_fading_openclose boolean:true
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:true
