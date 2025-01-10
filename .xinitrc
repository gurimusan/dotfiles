export LANG=ja_JP.UTF-8
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
# fcitx-autostart
fcitx5 &

xrdb -merge ~/.Xresources
exec awesome
