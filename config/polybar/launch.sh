#!/usr/bin/env bash

# Убить все запущенные экземпляры Polybar
killall -q polybar

# Ждать, пока процессы завершатся
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запуск Polybar на всех мониторах
# Если у вас один монитор, можно просто: polybar top -r &
# if type "xrandr" >/dev/null; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar top -r &
#   done
# else
#   polybar top -r &
# fi
polybar 2>&1 | tee -a /tmp/polybar.log &
disown
