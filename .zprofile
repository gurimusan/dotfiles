export EDITOR=vim
export LANG=ja_JP.UTF-8

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
