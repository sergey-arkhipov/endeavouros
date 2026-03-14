#!/bin/bash

# Проверяем текущее состояние анимаций
HYPRGAMER=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMER" = "1" ]; then
  # ВЫКЛЮЧАЕМ ВСЁ (Режим тишины)
  hyprctl --batch "\
        keyword animations:enabled 0; \
        keyword decoration:drop_shadow 0; \
        keyword decoration:blur:enabled 0"
  notify-send "Energy Saving Mode" "Animations and effects OFF" -i battery-low
else
  # ВКЛЮЧАЕМ ОБРАТНО (Режим красоты)
  hyprctl --batch "\
        keyword animations:enabled 1; \
        keyword decoration:drop_shadow 1; \
        keyword decoration:blur:enabled 1"
  notify-send "Performance Mode" "Animations and effects ON" -i battery-full
fi
