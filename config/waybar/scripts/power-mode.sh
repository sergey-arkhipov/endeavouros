#!/usr/bin/env bash

# Читаем текущий режим БЕЗ sudo
mode_line=$(tlp-stat -m 2>/dev/null | head -n1 | sed 's/ (manual)//; s|/.*||; s/^[[:space:]]*//; s/[[:space:]]*$//')
current="${mode_line,,}"
[[ -z "$current" ]] && current="balanced"

# Определяем следующий
case "$current" in
power-saver | low-power | power) next="balanced" ;;
balanced) next="performance" ;;
performance) next="power-saver" ;;
*) next="balanced" ;;
esac

# Меняем режим ТОЛЬКО если вызван с "set" — здесь sudo
if [[ "$1" == "set" ]]; then
  sudo tlp "$next" >/dev/null 2>&1
  # sleep 0.5 # чуть больше времени, TLP иногда медленно применяет
fi

# Повторно читаем актуальный режим (без sudo)
mode_line=$(tlp-stat -m 2>/dev/null | head -n1 | sed 's/ (manual)//; s|/.*||; s/^[[:space:]]*//; s/[[:space:]]*$//')
profile="${mode_line,,}"
[[ -z "$profile" ]] && profile="balanced"

# Только иконки + tooltip
case "$profile" in
power-saver | low-power | power)
  icon="" # лист — энергосбережение
  class="power-saver"
  ;;
balanced)
  icon="" # баланс
  class="balanced"
  ;;
performance)
  icon="" # молния
  class="performance"
  ;;
*)
  icon="?"
  class=""
  ;;
esac

tooltip="Текущий режим: ${profile^}"

# Компактный JSON
jq -n -c \
  --arg text "$icon" \
  --arg tooltip "$tooltip" \
  --arg class "$class" \
  '{
      "text":    $text,
      "tooltip": $tooltip,
      "class":   $class
  }'
