#!/bin/bash

# Получаем список всех VPN-соединений (используем grep -P для более строгого поиска типа VPN)
ALL_CONNECTIONS=$(nmcli -t -f NAME,TYPE connection show | grep -P ':vpn$|:wireguard$' | cut -d ':' -f 1)

# Получаем имя активного VPN-соединения
ACTIVE_VPN_NAME=$(nmcli -t -f NAME,TYPE connection show --active | grep -P ':vpn$|:wireguard$' | cut -d ':' -f 1)

VPN_LIST=""
declare -a DISPLAY_LIST

# 1. Сначала добавляем активное соединение (если есть) с префиксом '✓'
if [ -n "$ACTIVE_VPN_NAME" ]; then
  DISPLAY_LIST+=("✓ $ACTIVE_VPN_NAME")
fi

# 2. Добавляем неактивные соединения
while IFS= read -r CONN; do
  # Убеждаемся, что не добавляем активное соединение дважды
  if [ "$CONN" != "$ACTIVE_VPN_NAME" ]; then
    DISPLAY_LIST+=("$CONN")
  fi
done <<<"$ALL_CONNECTIONS"

# Преобразуем массив в строку с разделителями \n для Rofi
VPN_LIST=$(printf "%s\n" "${DISPLAY_LIST[@]}")

# Выводим список в Rofi и ждем выбора
CHOSEN_VPN=$(echo -e "$VPN_LIST" | rofi -dmenu -p "VPN  " -i) # Добавлен -i для поиска без учета регистра

# Если пользователь ничего не выбрал или выбрал пустую строку, выходим
if [ -z "$CHOSEN_VPN" ]; then
  exit 0
fi

# Удаляем префикс '✓' (для выбора активного соединения для отключения)
ACTION=$(echo "$CHOSEN_VPN" | sed "s/^✓ //")

# Если соединение активно, отключаем его. Иначе - подключаемся.
if nmcli con show --active | grep -q "$ACTION"; then
  dunstify -i network-vpn "VPN Disconnecting" "$ACTION"

  # notify-send "VPN Disconnecting" "$ACTION"
  nmcli con down id "$ACTION"
else
  # notify-send "VPN Connecting" "$ACTION"
  nmcli con up id "$ACTION"
fi
