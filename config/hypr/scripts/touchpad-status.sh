#!/usr/bin/env bash

STATUS_FILE="/tmp/touchpad.status"

if [ ! -f "$STATUS_FILE" ]; then
  echo "true" >"$STATUS_FILE"
fi

STATE=$(cat "$STATUS_FILE")

if [ "$STATE" = "true" ]; then
  echo '{"text": "󰟸", "class": "enabled"}'
else
  echo '{"text": "󰟸", "class": "disabled"}'
fi

# Популярные иконки для тачпада:
#
#      - мышь (включена)
#
#      - мышь (выключена)
#
#      - тачпад
#
#     󰟸 - тачпад
