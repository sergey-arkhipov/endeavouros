#!/bin/bash

# Ищем активное VPN-соединение и выводим его имя
# 'VPN' — это тип соединения, используемый NetworkManager
VPN_NAME=$(nmcli -t -f name,type connection show --active | grep vpn | cut -d ':' -f 1)

if [ -n "$VPN_NAME" ]; then
  # Если VPN активно, выводим иконку и его имя
  # Вы можете использовать другую иконку, например  (lock)
  echo " $VPN_NAME"
else
  # Если VPN не активно, выводим пустую строку или иконку
  echo " VPN OFF"
fi
