export EDITOR=nvim

alias oldvim="\vim"
alias oldvimdiff="\vimdiff"
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"

case $TERM in
linux)export LANG=C ;;
*)export LANG=ja_JP.UTF-8 ;;
esac

export PATH=$PATH:~/.local/bin:~/bin:~/.cargo/bin

export XDG_CONFIG_HOME="$HOME/.config"
