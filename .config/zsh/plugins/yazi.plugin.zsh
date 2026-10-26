#!/usr/bin/env zsh

function yazi-cd() {
    tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# This binds Ctrl-O to yazi-cd:
bindkey -s '^O' 'yazi-cd\n'
