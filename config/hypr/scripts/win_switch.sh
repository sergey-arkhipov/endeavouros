#!/bin/bash

# 1. Получаем список окон в формате JSON
win_list=$(hyprctl clients -j)

# 2. Формируем список для меню (только Заголовок и Класс)
# Иконки привязываем к классу, адрес здесь НЕ выводим
selection=$(echo "$win_list" | jq -r '.[] | select(.workspace.id != -1) | 
"[\(.workspace.id)] \(.title) ([\(.class)])\u0000icon\u001f\(.class as $c | ($c[0:1] | ascii_upcase) + $c[1:]),\(.initialClass),\(.class)"' |
  fuzzel -d --prompt "Переключиться на окно >")

# Если ничего не выбрали, выходим
[ -z "$selection" ] && exit 0

# 3. Ищем адрес окна по выбранной строке (Заголовок + Класс)
# Мы берем заголовок из выбора и ищем точное совпадение в JSON
addr=$(echo "$win_list" | jq -r --arg sel "$selection" '.[] | 
select("[\(.workspace.id)] \(.title) ([\(.class)])" == $sel) | .address' | head -n 1)

# 4. Переключаемся
if [ -z "$addr" ]; then
  notify-send "Ошибка" "Не удалось найти адрес окна"
else
  hyprctl dispatch focuswindow address:"$addr"
fi
