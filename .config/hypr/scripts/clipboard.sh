#!/bin/bash

case $1 in
-d | --delete)
  cliphist list | rofi -dmenu -replace | cliphist delete
  ;;
-c | --clear)
  if [ "$(echo -e "Clear\nCancel" | rofi -dmenu -replace)" == "Clear" ]; then
    cliphist wipe
  fi
  ;;
*)
  cliphist list | rofi -dmenu -replace | cliphist decode | wl-copy
  ;;
esac
