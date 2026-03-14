#!/bin/bash

hyprctl clients -j | jq -r '.[] | select(.workspace.id != -1) | 
  " \(.title) ([\(.class)])\u0000icon\u001f\(.class as $c | ($c[0:1] | ascii_upcase) + $c[1:]),\(.initialClass),\(.class)"' |
  fuzzel --dmenu -i --prompt "Переключиться на окно >" --width 90 --lines 12 |
  awk -F ' | ' '{print $NF}' |
  xargs -I{} hyprctl dispatch focuswindow address:{}
