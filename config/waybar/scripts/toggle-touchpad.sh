#!/usr/bin/env bash

DEVICE_NAME="ftcs1000:00-2808:0105-touchpad"
STATUS_FILE="/tmp/touchpad.status"

enable_touchpad() {
  echo "true" >"$STATUS_FILE"
  hyprctl keyword "device[$DEVICE_NAME]:enabled" true
  notify-send "Touchpad" "Enabled" -t 1500
}

disable_touchpad() {
  echo "false" >"$STATUS_FILE"
  hyprctl keyword "device[$DEVICE_NAME]:enabled" false
  notify-send "Touchpad" "Disabled" -t 1500
}

# Если файл не существует или содержит "false", включаем
if [ ! -f "$STATUS_FILE" ] || [ "$(cat "$STATUS_FILE")" = "false" ]; then
  enable_touchpad
else
  disable_touchpad
fi
