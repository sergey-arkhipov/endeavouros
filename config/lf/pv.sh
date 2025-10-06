#!/bin/sh
# ~/.config/lf/pv.sh
case "$1" in
*) bat --color=always --style=numbers "$1" ;;
esac
